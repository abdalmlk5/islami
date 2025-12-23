import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/app_assets.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/app_styles.dart';
import 'package:islami/models/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "sura details screen";

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> versesList = [];
  String verses = "";
  bool separatedVerses = false;

  @override
  Widget build(BuildContext context) {
    SuraModel sura = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (versesList.isEmpty) lodeSuraFile(sura.index);
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text(sura.nameEN, style: AppStyles.primary20),
        centerTitle: true,
        backgroundColor: AppColors.black,
        actions: [
          IconButton(
            icon: separatedVerses
                ? Icon(Icons.chrome_reader_mode_outlined)
                : Icon(Icons.chrome_reader_mode),
            onPressed: () {
              separatedVerses = !separatedVerses;
              setState(() {});
            },
          ),
        ],
        iconTheme: IconThemeData(color: AppColors.primary),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        AppAssets.cornerDecoration,
                        width: double.infinity,
                      ),
                      Text(
                        sura.nameAR,
                        style: AppStyles.primary20,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: versesList.isEmpty
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          )
                        : separatedVerses
                        ? ListView.separated(
                            itemBuilder: (context, index) => Container(
                              constraints: BoxConstraints(
                                minHeight: 70.0,
                                // maxHeight: 60.0,
                              ),
                              padding: EdgeInsets.all(20),
                              alignment: Alignment.center,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                                border: BoxBorder.all(color: AppColors.primary),
                              ),
                              child: Text(
                                "${versesList[index]}[${index + 1}]",
                                style: AppStyles.primary20,
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 10),
                            itemCount: versesList.length,
                          )
                        : ListView(
                            children: [
                              Text(
                                verses,
                                textDirection: TextDirection.rtl,
                                style: AppStyles.primary20,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
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

  void lodeSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      "assets/files/Suras/${index + 1}.txt",
    );
    versesList = fileContent.split("\n");
    for (int i = 1; i < versesList.length - 1; i++) {
      verses += "${versesList[i - 1]}[$i] ";
    }
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
