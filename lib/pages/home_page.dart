import 'package:catalogue_30_days/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int days = 9;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogue'),
      ),
      body: Center(
        child: Text('DAY $days of Flutter App Dev'),
      ),
      drawer: const MyDrawer(),
    );
  }
}
