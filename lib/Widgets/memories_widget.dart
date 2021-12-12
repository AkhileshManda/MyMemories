import 'package:arcore/models/memories.dart';
import 'package:arcore/providers/great_memories.dart';
import 'package:arcore/screens/memories_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/ar_widget.dart';
class MemoriesList extends StatefulWidget {
  const MemoriesList({Key key}) : super(key: key);

  @override
  _MemoriesListState createState() => _MemoriesListState();
}

class _MemoriesListState extends State<MemoriesList> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<GreatMemories>(context).fetchMemories(),
      builder: (context,snapshot) => snapshot.connectionState == ConnectionState.waiting ?
      CircularProgressIndicator():
          
       Consumer<GreatMemories>(
         child: Center(
           child: Text('Make new memories'),
         ),
          builder: (context,greatMemories,ch)=> greatMemories.items.length<=0 ? ch:
          SingleChildScrollView(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),

                shrinkWrap: true,
                itemCount: greatMemories.items.length,
                itemBuilder: (BuildContext context,int index){
                  return GestureDetector(
                    onTap: (){},
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,

                              child: Image(image: FileImage(greatMemories.items[index].image))),
                          Column(
                            children: [
                              Text(greatMemories.items[index].title),
                              Text(greatMemories.items[index].description),
                              Text(greatMemories.items[index].time.toString())
                            ],
                          ),
                          ElevatedButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ARPage()));
                          },
                              child: const Text('GO AR'))
                        ],
                      ),
                    ),
                  );
                }
            ),
          )
      ),
    );
  }
}
