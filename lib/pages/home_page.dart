// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:catalogue_30_days/core/store.dart';
import 'package:catalogue_30_days/models/cart_model.dart';
import 'package:catalogue_30_days/models/catalog.dart';
import 'package:catalogue_30_days/utils/routes.dart';
import 'package:catalogue_30_days/widgets/home_widgets/catalog_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catalog_header.dart';

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

  // final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  // final uri = Uri.https('api.jsonbin.io', 'b/604dbddb683e7e079c4eefd3');
  loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    var catalogJson = await rootBundle.loadString('assets/files/catalog.json');
    // print(uri);
    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;
    var decodedData = jsonDecode(catalogJson);
    final productData = decodedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //int days = 17;
    final CartModel? cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, store, status) {
          return Badge(
            label: Text('${cart!.items.length}'),
            isLabelVisible: (cart.items.isNotEmpty) ? true : false,
            largeSize: 20,
            alignment: const AlignmentDirectional(35, -4),
            child: FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
              backgroundColor: Theme.of(context).canvasColor,
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.mH32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                const CatalogList().expand()
              else
                const CircularProgressIndicator.adaptive().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
