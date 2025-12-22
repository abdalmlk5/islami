import 'package:flutter/material.dart';
import 'package:islami/core/app_assets.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/app_styles.dart';
import 'package:islami/models/sura_model.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = "sura details screen";

  const SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SuraModel sura = ModalRoute.of(context)!.settings.arguments as SuraModel;

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text(sura.nameEN, style: AppStyles.primary20),
        centerTitle: true,
        backgroundColor: AppColors.black,
        iconTheme: IconThemeData(color: AppColors.primary),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        AppAssets.cornerDecoration,
                        width: double.infinity,
                      ),
                      Text(sura.nameAR, style: AppStyles.primary20),
                      Expanded(child: SizedBox()),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Image.asset(AppAssets.bottomDecoration, width: double.infinity),
        ],
      ),
    );
  }
}
