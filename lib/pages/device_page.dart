import 'dart:convert';

import 'package:catalogue_30_days/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyDevices extends StatefulWidget {
  const MyDevices({super.key});

  @override
  State<MyDevices> createState() => _MyDevicesState();
}

class _MyDevicesState extends State<MyDevices> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogJson = await rootBundle.loadString('assets/files/catalog.json');
    var decodedData = jsonDecode(catalogJson);
    final productData = decodedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Item itemsList = CatalogModel.items[1];

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
