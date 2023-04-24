// ignore_for_file: deprecated_member_use

import 'package:catalogue_30_days/models/catalog.dart';
import 'package:catalogue_30_days/pages/device_page.dart';
import 'package:catalogue_30_days/widgets/home_widgets/catalog_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final item = CatalogModel.items[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DevicePage(item: item),
              ),
            );
          },
          child: CatalogItem(
            item: item,
          ),
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
        Hero(
          tag: item.id.toString(),
          child: CatalogImage(image: item.image),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              item.name.text.lg.bold.make(),
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
                              context.theme.buttonColor)),
                      child: "Add to Cart".text.sm.make())
                ],
              )
            ],
          ),
        ),
      ],
    )).color(context.cardColor).rounded.square(150).make().py16();
  }
}
