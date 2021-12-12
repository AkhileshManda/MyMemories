import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/memories.dart';
import "package:intl/intl.dart";

class Memory_Item extends StatelessWidget {
  void selection(BuildContext ctx, String id) {
    Navigator.of(ctx).pushNamed(
      '/memory_screen', arguments: id,
      //through id we can fetch other details later
    );
  }

  @override
  Widget build(BuildContext context) {
    final memory = Provider.of<Memory>(context);
    return InkWell(
      onTap: () => selection(context, memory.id),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.network(
                      memory.imageUrl,
                      height: 90,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.only(top: 4, right: 4),
                        width: 110,
                        height: 25,
                        color: Colors.black54,
                        child: Text(
                          memory.title,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 15),
                        ),
                      ))
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        DateFormat.yMMM().format(memory.date),
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      memory.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                    onPressed: () {
                      memory.toggleFavorite();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
