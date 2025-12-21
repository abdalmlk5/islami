import 'package:flutter/material.dart';
import 'package:islami/core/app_styles.dart';
import 'package:islami/models/sura_model.dart';

import '../core/app_assets.dart';
import '../core/app_colors.dart';

class MostRecentItem extends StatelessWidget {
  final SuraModel sura;

  const MostRecentItem({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 280,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(sura.nameEN, style: AppStyles.black24),
                Text(sura.nameAR, style: AppStyles.black24),
                Text(sura.verses, style: AppStyles.black24),
              ],
            ),
          ),
          Expanded(child: Image.asset(AppAssets.mostRecentImage)),
        ],
      ),
    );
  }
}
