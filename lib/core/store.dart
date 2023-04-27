import 'package:catalogue_30_days/models/cart_model.dart';
import 'package:catalogue_30_days/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatalogModel? catalog;
  CartModel? cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart!.catalog = catalog;
  }
}
