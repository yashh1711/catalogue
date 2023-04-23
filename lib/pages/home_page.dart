import 'dart:convert';

import 'package:catalogue_30_days/models/catalog.dart';
import 'package:catalogue_30_days/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    Future;
    var catalogJson = await rootBundle.loadString('assets/files/catalog.json');
    var decodedData = jsonDecode(catalogJson);
    final productData = decodedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //int days = 16;
    return Scaffold(
      appBar: AppBar(
        title: const Text('CATALOGUE'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            final item = CatalogModel.items[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: GridTile(
                header: Container(
                  //margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(color: Colors.deepPurple),
                  child: Text(
                    item.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                footer: Container(
                  //margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(color: Colors.deepOrange),
                  child: Text(
                    item.price.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                child: Image.network(item.image),
              ),
            );
          },
          itemCount: CatalogModel.items.length,
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
