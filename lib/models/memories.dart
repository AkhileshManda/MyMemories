import 'dart:io';
class Memories{
  String id;
  String title;
  String description;
  DateTime time;
  final File image;
  //Constructor
  Memories({

  this.description,
  this.time,
  this.title,
  this.image,
    this.id,
  });
}