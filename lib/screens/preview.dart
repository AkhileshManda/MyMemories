import 'package:flutter/material.dart';

class Preview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imgUrl = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: Image.network(imgUrl)),
    );
  }
}
