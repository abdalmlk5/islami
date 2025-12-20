import 'package:flutter/material.dart';
import 'package:islami/screens/Home/home_screen.dart';
import 'package:islami/screens/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: IntroScreen.routeName,

      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        IntroScreen.routeName: (context) => IntroScreen(),
      },
    );
  }
}
