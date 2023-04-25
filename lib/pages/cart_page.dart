import 'package:catalogue_30_days/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  // final Item item;
  CartPage({
    super.key,
  });

  // @override
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          const _CartList().px32().pOnly(top: 8, bottom: 32).expand(),
          const Divider(),
          SizedBox(
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${_cart.totalPrice}".text.xl4.make().expand(),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            context.theme.buttonColor),
                        elevation: const MaterialStatePropertyAll(2),
                        shape: MaterialStateProperty.resolveWith(
                          (states) => const StadiumBorder(),
                        ),
                        minimumSize:
                            const MaterialStatePropertyAll(Size(150, 50))),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: "Buying not supported yet".text.make(),
                          padding: const EdgeInsets.all(20),
                          backgroundColor: context.theme.buttonColor,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    child: "Buy Now".text.make())
              ],
            ).px32(),
          )
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList();

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
            onPressed: () {}, icon: const Icon(Icons.remove_circle_outlined)),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}
