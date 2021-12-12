import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';

class ARPage extends StatefulWidget {
  const ARPage({Key key}) : super(key: key);

  @override
  _ARPageState createState() => _ARPageState();
}

class _ARPageState extends State<ARPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My NASA Visit'),
      ),
      body: Column(
        children: [
          SizedBox(
            child: ModelViewer(
              src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
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
          const Text("My NASA Visit", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text("I visited NASA today and saw a lot of cool stuff!", style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
