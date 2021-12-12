import 'package:arcore/providers/great_memories.dart';
import 'package:arcore/screens/add_memories.dart';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'screens/ar_widget.dart';
import 'screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatMemories(),
      child: MaterialApp(
        title: 'My Memories',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: HomePage(),
        routes: {AddMemories.routeName: (ctx) => AddMemories()},
      ),
    );
  }
}
