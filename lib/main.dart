import 'package:catalogue_30_days/pages/cart_page.dart';
import 'package:catalogue_30_days/pages/home_page.dart';
import 'package:catalogue_30_days/pages/login_page.dart';
import 'package:catalogue_30_days/utils/routes.dart';
import 'package:catalogue_30_days/widgets/themes.dart';
import 'package:flutter/material.dart';

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
      themeMode: ThemeMode.system, //Light for light theme, dark for dark theme
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage()
      },
    );
  }
}
