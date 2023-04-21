import 'package:catalogue_30_days/models/catalog.dart';
import 'package:flutter/material.dart';

class MyDevices extends StatelessWidget {
  const MyDevices({super.key});

  @override
  Widget build(BuildContext context) {
    final Item itemsList = CatalogModel.items[0];

    return Scaffold(
      appBar: AppBar(
        title: Text(itemsList.name),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.network(itemsList.image),
          ),
          Text(itemsList.desc)
        ],
      ),
    );
  }
}
