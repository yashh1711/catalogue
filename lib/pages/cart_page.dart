import 'package:catalogue_30_days/core/store.dart';
import 'package:catalogue_30_days/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  // final Item item;
  CartPage({
    super.key,
  });

  // @override
  final CartModel? _cart = (VxState.store as MyStore).cart;
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
          _CartList().px32().pOnly(top: 8, bottom: 32).expand(),
          const Divider(),
          SizedBox(
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VxConsumer(
                  builder: (context, store, status) {
                    return "\$${_cart?.totalPrice}".text.xl4.make().expand();
                  },
                  mutations: const {RemoveMutation},
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            context.theme.canvasColor),
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
                          backgroundColor: context.theme.canvasColor,
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
  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  // const _CartList();
  @override
  Widget build(BuildContext context) {
    final CartModel? cart = (VxState.store as MyStore).cart;
    VxState.watch(context, on: [RemoveMutation]);
    return ListView.builder(
      itemCount: cart?.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
            onPressed: () {
              RemoveMutation(cart!.items[index]);
            },
            icon: const Icon(Icons.remove_circle_outlined)),
        title: cart?.items[index].name.text.make(),
      ),
    );
  }
}
