// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:catalogue_30_days/models/cart_model.dart';
import 'package:catalogue_30_days/models/catalog.dart';
import 'package:catalogue_30_days/pages/device_page.dart';
import 'package:catalogue_30_days/widgets/home_widgets/catalog_image.dart';

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

  const CatalogItem({
    Key? key,
    required this.item,
  }) : super(key: key);

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
                  AddToCart(item: item),
                ],
              )
            ],
          ),
        ),
      ],
    )).color(context.cardColor).rounded.square(150).make().py16();
  }
}

class AddToCart extends StatefulWidget {
  final Item item;

  const AddToCart({super.key, required this.item});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        final catalog = CatalogModel();
        final cart = CartModel();
        cart.add(widget.item);
        cart.catalog = catalog;
        setState(() {});
      },
      style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(2),
          shape: const MaterialStatePropertyAll(StadiumBorder()),
          backgroundColor: MaterialStatePropertyAll(context.theme.buttonColor)),
      child: isAdded ? const Icon(Icons.done) : "Add to Cart".text.sm.make(),
    );
  }
}
