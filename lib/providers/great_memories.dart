import 'package:arcore/Database/db_helper.dart';
import 'package:arcore/models/memories.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class GreatMemories with ChangeNotifier{

  List<Memories> _items =[];

  List<Memories> get items{
    return [..._items];
  }

  void addMemory(String title, File pickedImage,String desc){

    final newMemory = Memories(
      image: pickedImage,
      title: title,
      time: DateTime.now(),
      description: desc,
      id: DateTime.now().toString()
    );

    _items.add(newMemory);
    notifyListeners();


    DBHelper.insert('memories', {
      'id':newMemory.id,
      'title': newMemory.title,
      'description': newMemory.description,
      'image': newMemory.image.path
    });



  }
  
  Future<void> fetchMemories() async{
    
    final dataList = await DBHelper.getData('memories');
    _items = dataList.map((mem) => Memories(
      id: mem['id'],
      description: mem['description'],
      image: File(mem['image']),
      title: mem['title'],

    )).toList();
  }
}