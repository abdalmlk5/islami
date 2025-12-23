import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:islami/core/app_assets.dart';

import '../../../core/app_styles.dart';

class SebhaTap extends StatefulWidget {
  const SebhaTap({super.key});

  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  int currentZekr = 0;
  List<String> azkar = ["سبحان الله", "الحمد لله", "الله أكبر"];
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    double angle = (_count * 6 * math.pi) / 33;

    return Column(
      children: [
        Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى", style: AppStyles.white36),
        GestureDetector(
          onTap: () {
            setState(() {
              if (_count == 33) {
                _count = 0;
                currentZekr++;
                if (currentZekr == azkar.length) {
                  currentZekr = 0;
                }
              } else {
                _count++;
              }
            });
          },
          child: Column(
            children: [
              Image.asset(AppAssets.sebhaHead),
              Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: angle,
                    child: Image.asset(
                      AppAssets.sebhaBody,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Text(azkar[currentZekr], style: AppStyles.white36),
                      Text("$_count", style: AppStyles.white36),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
