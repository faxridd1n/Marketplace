import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/home_page.dart';
import 'package:flutter_application_1/screens/navigation/navigation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: '/navigation',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: const NavigationPage(),
      routes: {

        '/navigation':(BuildContext context)=>const NavigationPage(),
        '/home':(BuildContext context)=>const HomePage(),
        // '/navigation':(BuildContext context)=>const NavigationPage(),
        // '/navigation':(BuildContext context)=>const NavigationPage(),
        // '/navigation':(BuildContext context)=>const NavigationPage(),
        // '/navigation':(BuildContext context)=>const NavigationPage(),
        
      },

      
    );
  }
}






