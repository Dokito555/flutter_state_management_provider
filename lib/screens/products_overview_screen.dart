import 'package:flutter/material.dart';
import 'package:flutter_provider_tutorial/screens/cart_screen.dart';
import 'package:flutter_provider_tutorial/widgets/badge.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';
import '../widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {

  static const routeName = '/product-overview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          Consumer<CartProvider>(
            builder: (context, value, child) {
              return Badge(
                value: value.itemCount.toString(),
                child: child
              );
            },
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CartScreen.routeName, 
                );
              },
            ),
          )
        ],
      ),
      body: ProductGrid(),
    );
  }
}
