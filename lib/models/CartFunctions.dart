import 'package:flutter/material.dart';
import 'package:online_store_client_side/models/item.dart';

class CartFunctions extends ChangeNotifier {
  List<Item> _items = [];
  double _totalPrice = 0.0;
  void add(Item item) {
    _items.add(item);
    _totalPrice += item.price;
    notifyListeners();
  }

  void remove(Item item) {
    _totalPrice -= item.price;
    _items.remove(item);
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _totalPrice;
  }

  List<Item> get basketItems {
    return _items;
  }
}
