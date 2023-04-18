import 'package:catalogue_30_days/pages/home_page.dart';
import 'package:catalogue_30_days/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //This property is used to hide the debug banner on right side of device
      themeMode: ThemeMode.light, //Light for light theme, dark for dark theme
      theme: ThemeData(
        //useMaterial3: true,                   //For modern UI design
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.abrilFatface().fontFamily,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, //For dark theme
      ),
      initialRoute: "/login",
      routes: {
        "/": (context) => const HomePage(),
        "/login": (context) => const LoginPage(),
      },
    );
  }
}
