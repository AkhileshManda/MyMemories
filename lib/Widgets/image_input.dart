import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sysPath;
class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  ImageInput( {this.onSelectImage});

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

  File _storedImage;

  Future<void> _takePicture()async{
    final imageFile =  await ImagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 600 );
    setState(() {
      _storedImage = imageFile;
    });

    if(imageFile==null){
      return;
    }

    final appDir = await sysPath.getApplicationDocumentsDirectory();
    final filename = path.basename(imageFile.path);

    final savedImage = await imageFile.copy('${appDir.path}/$filename');

    widget.onSelectImage(savedImage);


  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Container(
            width: 100, height: 100,
            decoration: BoxDecoration(border: Border.all(width: 1)),
            child: _storedImage !=null ? Image.file(_storedImage,
              fit: BoxFit.cover, width: double.infinity,)
                : Text('No Image Taken',textAlign: TextAlign.center,),
          alignment: Alignment.center,
          ),
          const SizedBox(height: 10,),

          Expanded(
              child: FlatButton.icon(
                  onPressed: _takePicture,
                  icon: Icon(Icons.camera),
                  label: Text('Add Picture')
              )
          )
        ],
      ),
    );
  }
}
