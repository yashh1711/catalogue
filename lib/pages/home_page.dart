import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int days = 2;
    return Material(
      child: Center(
        child: Text('DAY $days of Flutter App Dev'),
      ),
    );
  }
}
