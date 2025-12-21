import 'package:flutter/material.dart';
import 'package:islami/core/app_assets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.quranBg,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(body: Column()),
      ],
    );
  }
}
