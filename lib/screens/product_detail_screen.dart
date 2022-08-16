import 'package:flutter/material.dart';
import 'package:flutter_provider_tutorial/provider/cart_provider.dart';
import 'package:flutter_provider_tutorial/provider/products_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/badge.dart';
import 'cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String; // is the id!
    final product = Provider.of<ProductProvider>(context).findById(productId);
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            product.title,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "\$${product.price}",
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            product.description,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton(
            onPressed: () {
              cart.addCart(productId, product.title, product.price);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added to cart item count ${cart.itemCount}'),
                  duration: const Duration(milliseconds: 800),
                )
              );
            },
            child: const Text(
              'add to cart',
              style: TextStyle(
              fontSize: 24,
            ),
            ),
          )
        ],
      ),
    );
  }
}
