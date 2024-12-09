import 'package:flutter/material.dart';
import 'package:buybliss2/model/product_data.dart';

class FavouriteProvider with ChangeNotifier {
  final List<Product> _listProducts = demoProducts;

  late int id;

  List<Product> get favouriteProducts {
    return _listProducts.where((product) => product.isFavourite).toList();
  }

  List<Product> get listProducts => _listProducts;

  void toggleFavouriteStatus(int id) {
    final productIndex =
        _listProducts.indexWhere((product) => product.id == id);
    _listProducts[productIndex].isFavourite =
        !_listProducts[productIndex].isFavourite;
    notifyListeners();
  }
}
