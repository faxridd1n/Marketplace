import 'dart:async';
import 'package:flutter_application_1/core/language/language_constants.dart';
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
        locale: _locale,
        // Locale('en',''),
        theme: ThemeData(fontFamily: 'Montserrat'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: BlocListener<AuthenticationBloc, AuthenticationState>(
          listenWhen: (o, n) => o.userAuthStatus != n.userAuthStatus,
          listener: (context, state) {
            context.read<ProfileBloc>().add(GetUserProfile());
            context.read<BasketBloc>().add(GetBasketProductsEvent());
            context
                .read<BasketBloc>()
                .add(GetOrganizationEvent(organizationId: 9));
          },
          child: const NavigationPage(),
        ),
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
