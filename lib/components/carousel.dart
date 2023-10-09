import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyCarousel extends StatelessWidget {
  final List<Widget> items;
  final CarouselOptions carouselOptions;

  MyCarousel({required this.items, required this.carouselOptions});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: carouselOptions,
      items: items,
    );
  }
}
