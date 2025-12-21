import 'package:flutter/material.dart';
import 'package:islami/core/app_assets.dart';
import 'package:islami/core/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

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
        Scaffold(
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
              // showUnselectedLabels: true,
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
          child: ImageIcon(AssetImage(iconName)))
          : ImageIcon(AssetImage(iconName)),
      label: label,
    );
  }
}
