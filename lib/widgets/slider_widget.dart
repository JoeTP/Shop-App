import 'package:flutter/material.dart';
import 'package:shop_app/config/variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shop_app/models/home_model.dart';

class SliderOffers extends StatelessWidget {
  final HomeModel model;
  SliderOffers({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: CarouselSlider(
        items: model.data!.banners
            .map((e) => ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            image: NetworkImage(e.image!),
            width: screenWidth,
            fit: BoxFit.cover,
          ),
        ))
            .toList(),
        options: CarouselOptions(
          reverse: false,
          autoPlay: true,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayInterval: Duration(seconds: 10),
        ),
      ),
    );
  }
}
