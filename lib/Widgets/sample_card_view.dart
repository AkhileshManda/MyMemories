import 'package:arcore/ar_widgets/ar_widget.dart';
import 'package:arcore/ar_widgets/ar_widget2.dart';
import 'package:arcore/screens/sample_memory_details.dart';
import 'package:flutter/material.dart';

class SampleCards extends StatelessWidget {
  const SampleCards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      shrinkWrap: true,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleMemoryDetails(
                          title: 'My NASA Visit',
                          desc: 'Finally, I got a chance to visit NASA. It was one of my greatest dreams since I got in love with astronomy. I explored and learned a lot during this visit. I also got a chance to meet some of the great scientists and learn about their most recent research. I saw some of the most advanced types of equipment there and even got lucky as they allowed us to use some under the guidance of experts. I really enjoyed the trip and it became one of the best memory of my life.',
                          dateTime: DateTime.now(),
                          image: 'assets/nasa.jpg',
                        )));
          },
          child: Card(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 200, width: 200,
                    child: Image(image: AssetImage('assets/nasa.jpg'), fit: BoxFit.cover)
                    ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'My NASA Visit',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ARPage()));
                      },
                      child: const Text('Go to AR'))
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleMemoryDetails(
                          title: 'The Kebab Place',
                          desc:
                              'Kebab is one of my most favorite dishes and today I got invited to the best Kebab restaurant in the whole city. When I got there I not only tasted the best Kebab of my life but also coincidently met one of my old friends. The combination of the both made this visit one of the best memory of my life.',
                          dateTime: DateTime.now(),
                          image: 'assets/kebab.jpg',
                        )));
          },
          child: Card(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 200, width: 200,
                    child: const Image(image: AssetImage('assets/kebab.jpg'), fit: BoxFit.cover)),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'The Kebab Place',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ARPage2()));
                      },
                      child: Text('Go to AR'))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
