import 'dart:convert';

import 'package:catalogue_30_days/models/catalog.dart';
import 'package:catalogue_30_days/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

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
    //int days = 17;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              const CatalogList().expand(),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalogue".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending Products".text.lg.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final item = CatalogModel.items[index];
        return CatalogItem(
          item: item,
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item item;

  const CatalogItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(image: item.image),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              item.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              item.desc.text.sm.caption(context).make(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${item.price}".text.bold.xl.make(),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          elevation: const MaterialStatePropertyAll(2),
                          shape:
                              const MaterialStatePropertyAll(StadiumBorder()),
                          backgroundColor: MaterialStatePropertyAll(
                              MyTheme.darkBluishColor)),
                      child: "Buy".text.make())
                ],
              )
            ],
          ),
        ),
      ],
    )).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .color(MyTheme.creamColor)
        .rounded
        .make()
        .p8()
        .w40(context);
  }
}
