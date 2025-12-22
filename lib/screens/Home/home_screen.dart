import 'package:flutter/material.dart';
import 'package:islami/core/app_assets.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/screens/Home/taps/hadeth_tap.dart';
import 'package:islami/screens/Home/taps/quran_tap.dart';
import 'package:islami/screens/Home/taps/radio_tap.dart';
import 'package:islami/screens/Home/taps/sebha_tap.dart';
import 'package:islami/screens/Home/taps/time_tap.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgrounds = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];
  List taps = [QuranScreen(), HadethTap(), SebhaTap(), RadioTap(), TimeTap()];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgrounds[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: [
                Center(child: Image(image: AssetImage(AppAssets.islamiTop))),
                taps[selectedIndex],
              ],
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: AppColors.primary),
            child: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              currentIndex: selectedIndex,
              items: [
                buildBottomNavigationBarItem(
                  index: 0,
                  iconName: AppAssets.quranIcon,
                  label: "Quran",
                ),
                buildBottomNavigationBarItem(
                  index: 1,
                  iconName: AppAssets.hadethIcon,
                  label: "Hadeth",
                ),
                buildBottomNavigationBarItem(
                  index: 2,
                  iconName: AppAssets.sebhaIcon,
                  label: "Sebha",
                ),

                buildBottomNavigationBarItem(
                  index: 3,
                  iconName: AppAssets.radioIcon,
                  label: "Radio",
                ),
                buildBottomNavigationBarItem(
                  index: 4,
                  iconName: AppAssets.timeIcon,
                  label: "Time",
                ),
              ],
              selectedItemColor: Colors.white,
              unselectedItemColor: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required int index,
    required String iconName,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: index == selectedIndex
          ? Container(
              height: 35,
              width: 60,
              decoration: BoxDecoration(
                color: Color.fromRGBO(32, 32, 32, 0.6),
                borderRadius: BorderRadius.circular(66),
              ),
              child: ImageIcon(AssetImage(iconName)),
            )
          : ImageIcon(AssetImage(iconName)),
      label: label,
    );
  }
}
