import 'package:catalogue_30_days/models/catalog.dart';
import 'package:catalogue_30_days/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DevicePage extends StatelessWidget {
  final Item item;
  const DevicePage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(item.name),
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${item.price}".text.bold.xl2.make(),
            AddToCart(
              item: item,
            ).wh(120, 50)
          ],
        ).p32(),
      ),
      body: Column(
        children: [
          Hero(
            tag: item.id.toString(),
            child: Image.network(item.image),
          ).h32(context),
          Expanded(
            child: VxArc(
              height: 35,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    item.name.text.lg.xl3.bold.make(),
                    item.desc.text.textStyle(context.captionStyle).make(),
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquet risus ac lacus tempor fermentum. Suspendisse aliquam odio accumsan erat sodales, in hendrerit dolor imperdiet. Phasellus vitae tellus quam. "
                        .text
                        .make()
                        .p8()
                        .expand()
                  ],
                ).py64(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
