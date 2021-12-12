import 'package:flutter/material.dart';
import 'dart:io';
class MemoryDetails extends StatelessWidget {

  String title;
  String desc;
  DateTime dateTime;
  File image;


  MemoryDetails({this.title,this.desc,this.dateTime,this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.667,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(image),
                fit: BoxFit.fill

              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(title,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,

              ),),
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: Text(desc,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,

            ),),
          ),
        ],
      ),
    );
  }
}
