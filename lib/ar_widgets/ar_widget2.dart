import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';

class ARPage2 extends StatefulWidget {
  const ARPage2({Key key}) : super(key: key);

  @override
  _ARPageState2 createState() => _ARPageState2();
}

class _ARPageState2 extends State<ARPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Awesome Kebab place'),
      ),
      body: Column(
        children: [
          SizedBox(
            child: ModelViewer(
              src: 'https://modelviewer.dev/shared-assets/models/shishkebab.glb',
              alt: "A 3D model of an astronaut",
              ar: true,
              autoRotate: true,
              cameraControls: true,
            ),
            height: 300,
            width: double.infinity,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("The Kebab Place", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text("I visited an awesome kebab place today with my imaginary gf", style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}