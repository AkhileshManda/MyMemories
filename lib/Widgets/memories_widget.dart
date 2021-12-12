import 'package:arcore/models/memories.dart';
import 'package:arcore/providers/great_memories.dart';
import 'package:arcore/screens/memories_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ar_widgets/ar_widget.dart';
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
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: SizedBox()
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
                    onTap: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> MemoryDetails(
                          image: greatMemories.items[index].image,
                          desc: greatMemories.items[index].description,
                          title: greatMemories.items[index].title,
                          dateTime: greatMemories.items[index].time,
                        ))
                      );
                    },
                    child: Card(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image(image: FileImage(greatMemories.items[index].image),
                            fit: BoxFit.contain,),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(greatMemories.items[index].title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                  ),),
                                ),


                              ],
                            ),
                            ElevatedButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ARPage()));
                            },
                                child: const Text('GO AR'))
                          ],
                        ),
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
