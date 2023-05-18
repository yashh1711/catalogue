// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    //useMaterial3: true, //For modern UI design
    brightness: Brightness.light,
    // accentColor: Colors.deepPurple,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    canvasColor: creamColor,
    iconTheme: const IconThemeData(color: Colors.white),
    // buttonColor: darkBluishColor,
    // buttonTheme: ButtonThemeData(buttonColor: darkBluishColor),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w500),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    // accentColor: lightBluishColor,
    cardColor: Colors.black,
    canvasColor: darkcreamColor,
    iconTheme: const IconThemeData(color: Colors.white),

    // buttonColor: lightBluishColor,
    // buttonTheme: ButtonThemeData(buttonColor: lightBluishColor),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
          fontSize: 20, letterSpacing: 1.5, fontWeight: FontWeight.w500),
    ),
    //For dark theme
  );

  static Color creamColor = const Color(0xf5f5f5f5);
  static Color darkcreamColor = Vx.gray700;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.purple400;
}
