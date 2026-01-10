import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/items/hadeth_item.dart';

class HadethTap extends StatelessWidget {
  const HadethTap({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return CarouselSlider(
      items: List.generate(50, (index) => index + 1).map((index) {
        return HadethItem(index: index);
      }).toList(),
      options: CarouselOptions(height: height * .66, enlargeCenterPage: true),
    );
  }
}
