import 'package:catalogue_30_days/models/catalog.dart';

class CartModel {
  CatalogModel? catalog;

  final List<int> _itemId = [];

  List<Item> get items => _itemId.map((id) => catalog!.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemId.add(item.id);
  }

  void remove(Item item) {
    _itemId.remove(item.id);
  }
}
