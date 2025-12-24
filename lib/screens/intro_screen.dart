import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/cache_helper.dart';

import '../core/app_styles.dart';
import 'Home/home_screen.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = "intro screen";

  final List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      titleWidget: Text("Welcome To Islmi App", style: AppStyles.primary24),
      body: '',
      image: Image.asset("assets/images/intro frame 1.png"),
    ),
    PageViewModel(
      titleWidget: Text("Welcome To Islami", style: AppStyles.primary24),
      bodyWidget: Text(
        "We Are Very Excited To Have You In Our Community",
        style: AppStyles.primary20,
        textAlign: TextAlign.center,
      ),
      image: Image.asset("assets/images/intro frame 2.png"),
    ),
    PageViewModel(
      titleWidget: Text("Reading the Quran", style: AppStyles.primary24),
      bodyWidget: Text(
        "Read, and your Lord is the Most Generous",
        style: AppStyles.primary20,
        textAlign: TextAlign.center,
      ),
      image: Image.asset("assets/images/intro frame 3.png"),
    ),
    PageViewModel(
      titleWidget: Text("Bearish", style: AppStyles.primary24),
      bodyWidget: Text(
        "Praise the name of your Lord, the Most High",
        style: AppStyles.primary20,
        textAlign: TextAlign.center,
      ),
      image: Image.asset("assets/images/intro frame 4.png"),
    ),
    PageViewModel(
      titleWidget: Text("Holy Quran Radio", style: AppStyles.primary24),
      bodyWidget: Text(
        "You can listen to the Holy Quran Radio through the application for free and easily",
        style: AppStyles.primary20,
        textAlign: TextAlign.center,
      ),
      image: Image.asset("assets/images/intro frame 5.png"),
    ),
  ];

  IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: AppColors.black,
      pages: listPagesViewModel,
      globalHeader: Image.asset("assets/images/islami top.png"),
      bodyPadding: EdgeInsets.only(top: 266),
      showNextButton: true,
      next: const Text("Next", style: AppStyles.primary20),
      showDoneButton: true,
      done: const Text("Done", style: AppStyles.primary20),
      onDone: () async {
        await CacheHelper.saveBool(key: "introScreenFlag", value: true);
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      showBackButton: true,
      back: const Text("Back", style: AppStyles.primary20),
      showSkipButton: true,
      skip: const Text("Skip", style: AppStyles.primary20),
      onSkip: () async {
        await CacheHelper.saveBool(key: "introScreenFlag", value: true);
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      dotsDecorator: DotsDecorator(
        color: Colors.grey,
        activeColor: AppColors.primary,
        size: const Size(7.0, 7.0),
        activeSize: const Size(18.0, 7.0),
        activeShape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27.0),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }
}
