import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/memories.dart';

class MemoryScreen extends StatefulWidget {
  @override
  _MemoryScreenState createState() => _MemoryScreenState();
}

class _MemoryScreenState extends State<MemoryScreen> {
  void selection(BuildContext ctx, String url) {
    Navigator.of(ctx).pushNamed(
      '/preview',
      arguments: url,
    );
  }

  @override
  Widget build(BuildContext context) {
    final memoryId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedMemory =
        Provider.of<Memories>(context, listen: false).findById(memoryId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedMemory.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.teal[50],
          child: Column(
            children: [
              ClipRRect(
                // borderRadius: BorderRadius.only(),
                child: Image.network(loadedMemory.imageUrl),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  loadedMemory.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade100,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                padding: EdgeInsets.all(7),
                height: 100,
                width: 300,
                child: Text(
                  loadedMemory.description,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8)),
                margin: EdgeInsets.only(top: 6),
                // padding: EdgeInsets.symmetric(vertical: 5),
                width: 180,
                child: Text(
                  "Your Memories",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.eczar(fontSize: 16, color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                height: 320,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: loadedMemory.images.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Container(
                          height: 40,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              onTap: () => selection(
                                  context, loadedMemory.images[index]),
                              child: Image.network(
                                loadedMemory.images[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
