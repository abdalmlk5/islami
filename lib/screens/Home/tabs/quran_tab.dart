import 'package:flutter/material.dart';
import 'package:islami/core/app_styles.dart';
import 'package:islami/core/cache_helper.dart';
import 'package:islami/items/most_recent_item.dart';

import '../../../core/app_assets.dart';
import '../../../core/app_colors.dart';
import '../../../items/suras_list_item.dart';
import '../../../models/sura_model.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  TextEditingController searchController = TextEditingController();
  late List<String> mostRecentIndexList;

  List<SuraModel> surasList = [];
  List<SuraModel> filteredSurasList = [];

  void lodeRecentSuras() {
    setState(() {
      mostRecentIndexList = CacheHelper.getSurasList() ?? [];
    });
  }

  void fillSurasList(List<SuraModel> list) {
    for (int i = 0; i < 114; i++) {
      list.add(SuraModel(index: i));
    }
  }

  void _filterData(String value) {
    setState(() {
      filteredSurasList = surasList.where((element) {
        return element.nameAR.contains(value) ||
            element.nameEN.toLowerCase().contains(value.toLowerCase()) ||
            (element.index + 1).toString() == value;
      }).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lodeRecentSuras();
    fillSurasList(surasList);
    filteredSurasList = surasList;
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * .015),
        TextField(
          controller: searchController,
          onChanged: (value) {
            _filterData(value);
          },
          cursorColor: AppColors.primary,
          style: AppStyles.white16,
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
        if (mostRecentIndexList.isNotEmpty &&
            searchController.text.isEmpty) ...[
          SizedBox(height: screenHeight * .015),
          Text("Most Recent", style: AppStyles.white16),
          SizedBox(height: screenHeight * .015),
          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => MostRecentItem(
                onSuraOpen: lodeRecentSuras,
                sura: SuraModel(index: int.parse(mostRecentIndexList[index])),
              ),
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemCount: mostRecentIndexList.length,
            ),
          ),
        ],
        SizedBox(height: screenHeight * .015),
        Text("Suras List", style: AppStyles.white16),
        SizedBox(height: screenHeight * .015),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return SurasListItem(
              onSuraOpen: lodeRecentSuras,
              sura: filteredSurasList[index],
            );
          },
          separatorBuilder: (context, index) {
            return Divider(indent: 45, endIndent: 45);
          },
          itemCount: filteredSurasList.length,
        ),
      ],
    );
  }
}
