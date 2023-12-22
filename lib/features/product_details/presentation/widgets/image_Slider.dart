import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

import '../../../home/domain/entities/productDetails.dart';
import '../manager/cubit.dart';

Widget buildComplexImageSlider(List<ProductVarientImages2> images) {
  return CarouselSlider(
    items: images.map((image) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(image.imagePath ?? ""),
            fit: BoxFit.cover,
          ),
        ),
      );
    }).toList(),
    options: CarouselOptions(
      height: 300.0,
      enlargeCenterPage: false,
      autoPlay: true,
      aspectRatio: 16 / 9,
      viewportFraction: 0.9,
      autoPlayCurve: Curves.fastOutSlowIn,
      autoPlayAnimationDuration: Duration(seconds: 6),
      enableInfiniteScroll: true,
      scrollDirection: Axis.horizontal,
    ),
  );
}
