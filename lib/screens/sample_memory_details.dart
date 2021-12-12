import 'package:flutter/material.dart';
class SampleMemoryDetails extends StatelessWidget {

  String title;
  String desc;
  DateTime dateTime;
  String image;

  SampleMemoryDetails({this.title,this.desc,this.dateTime,this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            title
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.fill
      
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(title,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
      
                ),),
            ),
            Padding(
              padding: const EdgeInsets.all(3),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(desc,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
      
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
