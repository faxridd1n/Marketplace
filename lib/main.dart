import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/navigation/navigation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavigationPage(),
    );
  }
}
