import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/hive/user_token.dart';
import 'package:flutter_application_1/components/hive/user_token_model.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/screens/home/blocs/categories_bloc/categories_bloc.dart';
import 'package:flutter_application_1/screens/home/home_page.dart';
import 'package:flutter_application_1/screens/navigation/navigation_page.dart';
import 'package:flutter_application_1/screens/profile/profile_bloc/profile_bloc.dart';
import 'package:flutter_application_1/user_auth_bloc/user_auth_bloc.dart';
import 'package:flutter_application_1/user_auth_bloc/user_auth_event.dart';
import 'package:flutter_application_1/user_auth_bloc/user_auth_state.dart';
import 'package:hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => BasketBloc()),
        BlocProvider(create: (context) => CategoriesBloc()..add(CategoriesGetEvent())),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Montserrat'),
        home: BlocListener<AuthenticationBloc, AuthenticationState>(
          listenWhen: (o, n) => o.userAuthStatus != n.userAuthStatus,
          listener: (context, state) {
            context.read<ProfileBloc>().add(GetUserProfile());
            context.read<BasketBloc>().add(GetBasketProductsEvent());
            context.read<BasketBloc>().add(GetOrganizationEvent(organizationId: 9));
          },
          child: const NavigationPage(),
        ),
      ),
    );
  }
}
