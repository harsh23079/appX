import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    const url = "https://api.escuelajs.co/api/v1/products";

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    _products = (data as List).map((json) => Product.fromJson(json)).toList();

    notifyListeners();
  }
}
