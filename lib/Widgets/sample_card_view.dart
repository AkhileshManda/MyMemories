import 'package:flutter/material.dart';
class SampleCards extends StatelessWidget {
  const SampleCards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ),
      shrinkWrap: true,
      children: [
        SizedBox(
          width: 100,
          height: 200,
          child: Card(
            child: Column(
              children: [

                Container(
                  width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/happier.png'), fit: BoxFit.cover)
                    )
                ),



                Text('Title'),
                Text('Description'),

                ElevatedButton(
                    onPressed: (){},
                    child: Text('Go to AR')
                )


              ],
            ),
          ),
        ),
        Card(
          child: Column(
            children: [

              Image(image :AssetImage('assets/happier.png')),
              Text('Title'),
              Text('Description'),

              ElevatedButton(
                  onPressed: (){},
                  child: Text('Go to AR')
              )


            ],
          ),
        ),

      ],


    );
  }
}
