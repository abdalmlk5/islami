import 'package:flutter/material.dart';
import 'package:islami/core/cache_helper.dart';
import 'package:islami/screens/Home/home_screen.dart';
import 'package:islami/screens/intro_screen.dart';
import 'package:islami/screens/quran/sura_details_screen.dart';

import 'core/app_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  // CacheHelper.saveBool(key: key, value: value)

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool introScreenFlag = CacheHelper.getBool(key: "introScreenFlag") ?? false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: introScreenFlag
          ? HomeScreen.routeName
          : IntroScreen.routeName,

      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        IntroScreen.routeName: (context) => IntroScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
      },
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
