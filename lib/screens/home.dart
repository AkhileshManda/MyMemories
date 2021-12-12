import 'package:arcore/Widgets/music_widget.dart';
import 'package:arcore/screens/add_memories.dart';
import 'package:arcore/screens/ar_widget.dart';
import 'package:arcore/Widgets/carousel.dart';
import 'package:arcore/Widgets/memories_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            Carousel(),

            Text('Memories'),

            MemoriesList(),



            Text('Music'),

            ElevatedButton(onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MusicPage()));
            } ,
                child: Text('Go to Music page'))
          ],



        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){

          Navigator.of(context).pushNamed(AddMemories.routeName);

        },

      ),
    );
  }
}
