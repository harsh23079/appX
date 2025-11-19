import 'package:flutter/material.dart';
import '../models/product_mode.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Product> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('https://api.escuelajs.co/api/v1/products');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      _products = data.map((json) => Product.fromJson(json)).toList();
    }

    _isLoading = false;
    notifyListeners();
  }
}
