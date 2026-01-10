import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/app_styles.dart';
import 'package:islami/models/hadeth_model.dart';

class HadethItem extends StatefulWidget {
  final int index;

  const HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  HadethModel? hadeth;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    loadHadethFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: height * .02),
      padding: EdgeInsets.symmetric(
        horizontal: width * .01,
        vertical: width * .06,
      ),

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/hadeth_decoration.png"),
        ),
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: hadeth == null
          ? Center(child: CircularProgressIndicator(color: AppColors.black))
          : Column(
              spacing: height * .04,
              children: [
                Text(hadeth?.title ?? '', style: AppStyles.black24),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      hadeth?.body ?? '',
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: AppStyles.black16,
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Future<void> loadHadethFile(int index) async {
    String fileContent = await rootBundle.loadString(
      "assets/files/Hadeth/h$index.txt",
    );

    List<String> fileLines = fileContent.split("\n");
    String title = fileLines[0];
    fileLines = fileLines.sublist(1);
    String body = fileLines.join();

    // String title = fileContent.substring(0, fileContent.indexOf("\n"));
    // String body = fileContent.substring(fileContent.indexOf("\n"));
    hadeth = HadethModel(title: title, body: body);
    setState(() {});
  }
}
