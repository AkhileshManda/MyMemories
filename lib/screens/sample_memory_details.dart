import 'package:flutter/material.dart';
class SampleMemoryDetails extends StatelessWidget {

  String title;
  String desc;
  DateTime dateTime;



  SampleMemoryDetails({this.title,this.desc,this.dateTime});


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
                    image: AssetImage('assets/happier.png'),
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
