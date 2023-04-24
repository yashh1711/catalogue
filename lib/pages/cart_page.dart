import 'package:catalogue_30_days/widgets/themes.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  // final Item item;
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
