import 'package:arcore/Widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../providers/great_memories.dart';

class AddMemories extends StatefulWidget {
  const AddMemories({Key key}) : super(key: key);

  static const routeName = '/add-place';

  @override
  _AddMemoriesState createState() => _AddMemoriesState();
}

class _AddMemoriesState extends State<AddMemories> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage){

    _pickedImage = pickedImage;

  }

  void _saveMemory(){
    if(_titleController.text.isEmpty || _pickedImage== null){
      return;
    }
    
    Provider.of<GreatMemories>(context,listen: false).addMemory(
        _titleController.text, _pickedImage, _descController.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Add memories'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _descController,
                      decoration: InputDecoration(
                        labelText: 'Description',

                      ),
                    ),
                  ),

                  ImageInput(onSelectImage: _selectImage,)



                ],
              ),
            ),
          ),




          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton.icon(
              color: Colors.amber,
                onPressed:_saveMemory,
                icon: Icon(Icons.add),
              label: Text('Add place'),
              elevation: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          )

        ],
      ),
    );
  }
}
