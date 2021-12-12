import 'package:arcore/screens/ar_widget.dart';
import 'package:arcore/screens/sample_memory_details.dart';
import 'package:flutter/material.dart';
class SampleCards extends StatelessWidget {
  const SampleCards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ),
      shrinkWrap: true,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context,
              MaterialPageRoute(builder: (context)=> SampleMemoryDetails(
                title: 'title',
                desc: 'description',
                dateTime: DateTime.now(),
              ))
            );
          },
          child: Card(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Image(image :AssetImage('assets/happier.png')),



                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  ),


                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ARPage()));
                      },
                      child: Text('Go to AR')
                  )


                ],
              ),
            ),
          ),
        ),
        GestureDetector(

          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=> SampleMemoryDetails(
                  title: 'title',
                  desc: 'description',
                  dateTime: DateTime.now(),
                ))
            );
          },

          child: Card(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Image(image :AssetImage('assets/happier.png')),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),


                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ARPage()));
                      },
                      child: Text('Go to AR')
                  )


                ],
              ),
            ),
          ),
        ),

      ],


    );
  }
}
