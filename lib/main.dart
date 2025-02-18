import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_application_1/screens/internet_connection/no_internet_page.dart';
import 'package:flutter_application_1/widgets/indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/hive/user_token.dart';
import 'package:flutter_application_1/components/hive/user_token_model.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/screens/category/blocs/category_bloc/category_bloc.dart';
import 'package:flutter_application_1/screens/navigation/navigation_page.dart';
import 'package:flutter_application_1/screens/profile/profile_bloc/profile_page_bloc/profile_bloc.dart';
import 'package:flutter_application_1/user_auth_bloc/user_auth_bloc.dart';
import 'package:flutter_application_1/user_auth_bloc/user_auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'screens/profile/profile_bloc/user_cards_page_bloc/user_cards_bloc.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserTokenModelAdapter());
  userTokenBox = await Hive.openBox<UserTokenModel>('userToken');

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());
  }, (error, stack) async {
    print("captureException $error, stack $stack");
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getLocale().then((locale) => setLocale(locale));
  }

  bool _isConnected = false;
  bool _isCheckingConnection = true;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  @override
  void initState() {
    super.initState();
    _initConnectivity();
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future _initConnectivity() async {
    setState(() {
      _isCheckingConnection = true;
    });
    List<ConnectivityResult> results;
    try {
      results = await Connectivity().checkConnectivity();
    } catch (e) {
      print('$e');
      results = [ConnectivityResult.none];
    }

    return _updateConnectionStatus(results);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    setState(() {
      _isConnected = results.contains(ConnectivityResult.mobile) ||
          results.contains(ConnectivityResult.wifi);
      _isCheckingConnection = false;
    });
  }

  void _retryConnection() {
    _initConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => BasketBloc()),
        BlocProvider(create: (context) => UserCardsBloc()),
        BlocProvider(
            create: (context) => CategoriesBloc()..add(CategoriesGetEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: _locale,
        theme: ThemeData(fontFamily: 'Montserrat'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(builder: (BuildContext context) {
          if (_isCheckingConnection) {
            return const Scaffold(
              backgroundColor: AppColors.white,
              body: Center(
                child: CustomLoadingIndicator(),
              ),
            );
          } else {
            return _isConnected
                ? BlocListener<AuthenticationBloc, AuthenticationState>(
                    listenWhen: (o, n) => o.userAuthStatus != n.userAuthStatus,
                    listener: (context, state) {
                      context.read<ProfileBloc>().add(GetUserProfile());
                      context.read<BasketBloc>().add(GetBasketProductsEvent());
                      context
                          .read<BasketBloc>()
                          .add(GetOrganizationEvent(organizationId: 9));
                    },
                    child: const NavigationPage(),
                  )
                : NoInternetPage(
                    onRetry: _retryConnection,
                  );
          }
        }),
      ),
    );
  }
}
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => AuthenticationBloc()),
//         BlocProvider(create: (context) => ProfileBloc()),
//         BlocProvider(create: (context) => BasketBloc()),
//         BlocProvider(
//             create: (context) => CategoriesBloc()..add(CategoriesGetEvent())),
//       ],
//       child: MaterialApp(
//         locale: const Locale('ru', ''),
//         theme: ThemeData(fontFamily: 'Montserrat'),
//         localizationsDelegates: AppLocalizations.localizationsDelegates,
//         supportedLocales: AppLocalizations.supportedLocales,
//         home: BlocListener<AuthenticationBloc, AuthenticationState>(
//           listenWhen: (o, n) => o.userAuthStatus != n.userAuthStatus,
//           listener: (context, state) {
//             context.read<ProfileBloc>().add(GetUserProfile());
//             context.read<BasketBloc>().add(GetBasketProductsEvent());
//             context
//                 .read<BasketBloc>()
//                 .add(GetOrganizationEvent(organizationId: 9));
//           },
//           child: const NavigationPage(),
//         ),
//       ),
//     );
//   }
// }
