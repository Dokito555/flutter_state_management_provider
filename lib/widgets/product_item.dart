import 'package:flutter/material.dart';
import 'package:flutter_provider_tutorial/models/product.dart';
import 'package:flutter_provider_tutorial/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // hanya membawa data bukan update
    final productData = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<CartProvider>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          // update ui data
          leading: Consumer<Product>(
            builder: ((context, value, child) => 
              IconButton(
                icon: productData.isFavorite 
                  ? const Icon(Icons.favorite, color: Colors.amber,) 
                  : const Icon(Icons.favorite_border_outlined, color: Colors.amber,),
                onPressed: () {
                  productData.statusFav();
                },
              )
            ),
          ),
          title: Text(
            productData.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              cart.addCart(productData.id, productData.title, productData.price);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added to cart item count ${cart.itemCount}'),
                  duration: const Duration(milliseconds: 800),
                )
              );
            },
            color: Theme.of(context).accentColor,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: productData.id,
            );
          },
          child: Image.network(
            productData.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
