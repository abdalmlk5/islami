import 'package:flutter/material.dart';
import 'package:islami/core/app_styles.dart';
import 'package:islami/items/most_recent_item.dart';

import '../../../core/app_assets.dart';
import '../../../core/app_colors.dart';
import '../../../items/suras_list_item.dart';
import '../../../models/sura_model.dart';

class QuranScreen extends StatelessWidget {
  final sura1 = SuraModel(index: 0);

  QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            hintText: "Sura Name",
            hintStyle: AppStyles.white16,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primary),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primary),
            ),
            prefixIcon: ImageIcon(
              AssetImage(AppAssets.quranIcon),
              color: AppColors.primary,
            ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => MostRecentItem(sura: sura1),
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemCount: 114,
          ),
        ),
        SizedBox(height: 10),

        Text("Suras List", style: AppStyles.white16),

        SizedBox(height: 10),

        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return SurasListItem(sura: SuraModel(index: index));
          },
          separatorBuilder: (context, index) {
            return Divider(indent: 45, endIndent: 45);
          },
          itemCount: 114,
        ),
      ],
    );
  }
}
