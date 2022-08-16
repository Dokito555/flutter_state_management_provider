import 'package:flutter/material.dart';
import 'package:flutter_provider_tutorial/provider/products_provider.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import 'product_item.dart';

class ProductGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final allProducts = productData.allproducts;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: allProducts.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: allProducts[i],
        child: ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}