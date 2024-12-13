import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/hive/user_token.dart';
import 'package:flutter_application_1/components/hive/user_token_model.dart';
import 'package:flutter_application_1/screens/home/home_page.dart';
import 'package:flutter_application_1/screens/navigation/navigation_page.dart';
import 'package:flutter_application_1/user_auth_bloc/user_auth_bloc.dart';
import 'package:flutter_application_1/user_auth_bloc/user_auth_event.dart';
import 'package:hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserTokenModelAdapter());
  userTokenBox = await Hive.openBox<UserTokenModel>('userToken');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserAuthBloc()..add(AuthAppStarted()),
      child: MaterialApp(
        initialRoute: '/navigation',
        theme: ThemeData(fontFamily: 'Montserrat'),
        home: const NavigationPage(),
        routes: {
          '/navigation': (BuildContext context) => const NavigationPage(),
          '/home': (BuildContext context) => const HomePage(),
          // '/navigation':(BuildContext context)=>const NavigationPage(),
          // '/navigation':(BuildContext context)=>const NavigationPage(),
          // '/navigation':(BuildContext context)=>const NavigationPage(),
          // '/navigation':(BuildContext context)=>const NavigationPage(),
        },
      ),
    );
  }
}
