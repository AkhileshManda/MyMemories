import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../models/caro_image.dart';

class Carousel extends StatelessWidget {


  final List<CaroImage> contents=[
    CaroImage(
        content: '1',
        imgUrl: 'https://picsum.photos/250?image=9'
    ),
    CaroImage(
        content: '2',
        imgUrl: 'https://picsum.photos/250?image=9'
    ),
    CaroImage(
        content: '3',
        imgUrl: 'https://picsum.photos/250?image=9'
    ),
    CaroImage(
        content: '4',
        imgUrl: 'https://picsum.photos/250?image=9'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: contents.length,
        itemBuilder: (BuildContext context, i,pageViewIndex){
          return Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Card(
              color: Colors.blue,
              child: Center(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                           image: NetworkImage(contents[i].imgUrl),
                            fit: BoxFit.cover
                          )
                        ),
                      ),

                      Text(
                          contents[i].content
                      )


                    ],
                  )
              ),
            ),
          );
        },
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height*0.25,
            autoPlayAnimationDuration: const Duration(seconds: 3),
            autoPlay: true,
            aspectRatio: 3 / 2,
            enlargeCenterPage: true,
            autoPlayInterval: const Duration(seconds: 3)


        )
    );
  }
}
