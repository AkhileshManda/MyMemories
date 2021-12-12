import 'package:flutter/material.dart';
import 'package:my_memories/widgets/memory_item.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import '../providers/memories.dart';

class MemoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final memoriesdata = Provider.of<Memories>(context);
    final memories = memoriesdata.elements;
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // amount of columns
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10, // spacing between columns
          mainAxisSpacing: 10, //space between rows
        ),
        itemCount: memoriesdata.elements.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: memories[i],
              child: Memory_Item(),
            ));
  }
}
