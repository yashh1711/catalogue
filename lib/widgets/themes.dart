import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    //useMaterial3: true, //For modern UI design
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.poppins().fontFamily,
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
    brightness: Brightness.dark, //For dark theme
  );
}
