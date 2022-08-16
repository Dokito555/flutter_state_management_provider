import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_provider_tutorial/models/product.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _allproducts = List.generate(
    25,
    (index) {
      return Product(
        id: "id_${index + 1}",
        title: "Product ${index + 1}",
        description: 'Ini adalah deskripsi produk ${index + 1}',
        price: 10 + Random().nextInt(100).toDouble(),
        imageUrl: 'https://picsum.photos/id/$index/200/300',
      );
    },
  );

  List<Product> get allproducts => _allproducts;

  Product findById(id) {
    return _allproducts.firstWhere((prod) => prod.id == id);
  }
  
}