import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'productosapp-8b60a-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  late Product selectedProduct;

  bool isLoading = true;

  ProductsService() {
    loadProducts();
  }

// <List<Product>>
  Future <List<Product>> loadProducts() async {
    
    isLoading = true;
    notifyListeners();
    
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);

    final Map<String,dynamic> productsMap = json.decode(resp.body);

    // print(productsMap);

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;

      products.add(tempProduct);
    }); 

    isLoading = false;
    notifyListeners();

    return products;                   
  }

  
}
