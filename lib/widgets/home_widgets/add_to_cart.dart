import 'package:catalogue_30_days/core/store.dart';
import 'package:catalogue_30_days/models/cart_model.dart';
import 'package:catalogue_30_days/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item item;

  const AddToCart({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  // bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel? cart = (VxState.store as MyStore).cart;
    bool isInCart = cart!.items.contains(widget.item);

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          // isAdded = isAdded.toggle();
          AddMutation(widget.item);
        }
        // setState(() {});
      },
      style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(2),
          shape: const MaterialStatePropertyAll(StadiumBorder()),
          backgroundColor: MaterialStatePropertyAll(context.theme.buttonColor)),
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(
              (CupertinoIcons.cart_badge_plus),
            ),
    );
  }
}
