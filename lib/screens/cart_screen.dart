import 'package:flutter/material.dart';
import 'package:flutter_provider_tutorial/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {

    final cartData = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Text('Total \$${cartData.totalPrice}', style: const TextStyle(fontSize: 35),),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartData.itemCount,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cartData.items.values.toList()[index].title),
                  subtitle: Text('Qauntity : ${cartData.items.values.toList()[index].qty}'),
                  trailing: Container(
                    child: Text('\$${cartData.items.values.toList()[index].qty * cartData.items.values.toList()[index].price}'),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}