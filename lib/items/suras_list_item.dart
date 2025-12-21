import 'package:flutter/material.dart';
import 'package:islami/core/app_styles.dart';
import 'package:islami/models/sura_model.dart';

class SurasListItem extends StatelessWidget {
  final SuraModel sura;

  const SurasListItem({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Stack(
        alignment: Alignment.center,
        children: [
          Image(image: AssetImage("assets/images/frame.png")),
          Text("${sura.index + 1}", style: AppStyles.white20),
        ],
      ),
      title: Text(sura.nameEN, style: AppStyles.white20),
      subtitle: Text(sura.verses, style: AppStyles.white20),
      trailing: Text(sura.nameAR, style: AppStyles.white20),
    );
  }
}
