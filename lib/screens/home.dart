import 'package:arcore/Widgets/music_widget.dart';
import 'package:arcore/Widgets/sample_card_view.dart';
import 'package:arcore/screens/add_memories.dart';
//import 'package:arcore/screens/ar_widget.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Home',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),

              Carousel(),

              Text(
                'Music',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),

              TextButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                ),
                onPressed: () { 
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MusicPage()),
                  );
                 },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.black,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: ListTile(
                          leading: Icon(Icons.album, size: 60, color: Colors.white),
                          title:
                              Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Text('Be Happier', style: TextStyle(fontSize: 20.0, color: Colors.white)),
                              ),
                          subtitle: Text('Music is the key to the soul',
                              style: TextStyle(fontSize: 18.0, color: Colors.white)),
                        ),
                      ),
                      // ButtonBar(
                      //   children: <Widget>[
                      //     RaisedButton(
                      //       child: const Text('Play'),
                      //       onPressed: () {/* ... */},
                      //     ),
                      //     RaisedButton(
                      //       child: const Text('Pause'),
                      //       onPressed: () {/* ... */},
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => MusicPage()));
              //     },
              //     child: Text('Go to Music page')),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  'Memories',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              SampleCards(),
              MemoriesList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddMemories.routeName);
        },
      ),
    );
  }
}
