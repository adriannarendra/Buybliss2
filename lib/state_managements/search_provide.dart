import 'package:flutter/material.dart';
import 'package:buybliss2/model/product_data.dart';


class SearchProvider with ChangeNotifier {
  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  List<Product> _filteredProducts = [];
  List<Product> get filteredProducts => _filteredProducts;

  void updateSearchQuery(String query, List<Product> demoProducts) {
    _searchQuery = query;
    _filteredProducts = demoProducts
        .where((product) =>
            product.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners(); // Notify UI to rebuild when state changes
  }

  void clearSearch() {
    _searchQuery = '';
    _filteredProducts = [];
    notifyListeners();
  }
}