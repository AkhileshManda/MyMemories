import 'package:flutter/material.dart';
import 'package:my_memories/screens/memory_screen.dart';
import 'package:my_memories/screens/preview.dart';
import 'package:my_memories/screens/tabscreen.dart';
import 'package:my_memories/screens/sign_in.dart';
import 'package:provider/provider.dart';
import '../providers/memories.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Map<int, Color> color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };
  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xFF31639c, color);
    return ChangeNotifierProvider(
      create: (ctx) => Memories(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: colorCustom,
            accentColor: Colors.teal[200],
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                title: GoogleFonts.comfortaa(
                    color: Colors.white, fontWeight: FontWeight.bold),
                body1: GoogleFonts.varelaRound(),
                body2: TextStyle(fontFamily: 'DancingScript'))),
        routes: {
          '/': (ctx) =>
              TabScreen(), //here it should be signIn() but just for check i have placed homepag
          '/memory_screen': (ctx) => MemoryScreen(),
          '/preview': (ctx) => Preview(),
        },
      ),
    );
  }
}
