import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ARPage extends StatefulWidget {
  const ARPage({Key key}) : super(key: key);

  @override
  _ARPageState createState() => _ARPageState();
}

class _ARPageState extends State<ARPage> {

  ArCoreController arCoreController;

  _onArCoreViewCreated(ArCoreController _arcoreController){
    arCoreController = _arcoreController;
    _addSphere(arCoreController);
  }

  _addSphere(ArCoreController _arcoreController){
    final material = ArCoreMaterial(


        color: Colors.deepPurple
    );
    final sphere = ArCoreSphere(
        materials: [material], radius: 0.2
    );
    final cube = ArCoreCube(
      materials: [material], size: vector.Vector3(0.2,0.2,0.2),
    );
    // final node  = ArCoreRotatingNode(
    //   shape: sphere,
    //   degreesPerSecond: 10.5,
    //   position: vector.Vector3(0, 0, 1),
    //   scale: vector.Vector3(1, 1, 1),
    //   rotation: vector.Vector4(10, 10, 10, 10),
    //   name: 'Hello'
    // );
    final node = ArCoreRotatingNode(
      // image: ArCoreImage(bytes: Uint8List(10), width: 10, height: 10),
        shape: cube,
        position: vector.Vector3(0,0,-1)
    );
    _arcoreController.addArCoreNode(node);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    arCoreController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('sample app'),
        ),
        body: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
        )
    );
  }
}