// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:catalogue_30_days/core/store.dart';
import 'package:catalogue_30_days/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  CatalogModel? catalog;

  final List<int> _itemId = [];

  List<Item> get items => _itemId.map((id) => catalog!.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart!._itemId.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart!._itemId.remove(item.id);
  }
}
