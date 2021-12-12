import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../models/caro_image.dart';

class Carousel extends StatelessWidget {
  final List<CaroImage> contents = [
    CaroImage(content: '1', imgUrl: 'assets/quote1.jpeg'),
    CaroImage(content: '2', imgUrl: 'assets/quote2.jpeg'),
    CaroImage(content: '3', imgUrl: 'assets/quote3.jpeg'),
    CaroImage(content: '4', imgUrl: 'assets/quote4.jpeg'),
  ];

  Carousel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: contents.length,
        itemBuilder: (BuildContext context, i, pageViewIndex) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Card(
              color: Colors.blue,
              child: Center(
                  child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(contents[i].imgUrl),
                        fit: BoxFit.cover)),
              )),
            ),
          );
        },
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.25,
            autoPlayAnimationDuration: const Duration(seconds: 3),
            autoPlay: true,
            aspectRatio: 3 / 2,
            enlargeCenterPage: true,
            autoPlayInterval: const Duration(seconds: 3)));
  }
}
