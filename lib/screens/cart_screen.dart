import 'package:ecommerce_burguers/bloc/cart_bloc/cart_bloc.dart';
import 'package:ecommerce_burguers/bloc/cart_bloc/cart_event.dart';
import 'package:ecommerce_burguers/bloc/cart_bloc/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final currencyFormatter = NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.read<CartBloc>().add(ClearCart());
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 1),
                  content: Text('Item(s) removidos do carrinho!'),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            final items = state.items;

            if (items.isEmpty) {
              return const Center(child: Text('O carrinho está vazio.'));
            }

            double total = items.fold(
                0, (sum, item) => sum + (item.burger.price * item.quantity));

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return ListTile(
                        leading: Image.network(item.burger.imageUrl, width: 50),
                        title: Text(item.burger.name),
                        subtitle: Text('Quantidade: ${item.quantity}'),
                        trailing: Text(
                            '\$${(item.burger.price * item.quantity).toStringAsFixed(2)}'),
                      );
                      //     Card(
                      //   margin: const EdgeInsets.symmetric(
                      //       horizontal: 8.0, vertical: 4.0),
                      //   child: ListTile(
                      //     leading: Image.network(burger.imageUrl, width: 50),
                      //     title: Text(burger.name),
                      //     subtitle:
                      //         Text(currencyFormatter.format(burger.price)),
                      //     trailing: IconButton(
                      //       icon: const Icon(Icons.add_shopping_cart),
                      //       onPressed: () {
                      //         context.read<CartBloc>().add(AddToCart(burger));
                      //       },
                      //     ),
                      //   ),
                      // );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Total: \$${total.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
