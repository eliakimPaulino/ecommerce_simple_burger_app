import 'package:ecommerce_burguers/bloc/burger_bloc/burger_state.dart';
import 'package:ecommerce_burguers/bloc/cart_bloc/cart_bloc.dart';
import 'package:ecommerce_burguers/bloc/cart_bloc/cart_event.dart';
import 'package:ecommerce_burguers/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/burger_bloc/burger_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final currencyFormatter = NumberFormat.simpleCurrency();

  Future<bool> _isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.data == false) {
          return const LoginScreen();
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Burger Shop'),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
              ),
            ],
          ),
          body: BlocBuilder<BurgerBloc, BurgerBlocState>(
            builder: (context, state) {
              if (state is BurgerLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is BurgerLoaded) {
                final burgers = state.burgers;
                return ListView.builder(
                  itemCount: burgers.length,
                  itemBuilder: (context, index) {
                    final burger = burgers[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: ListTile(
                        leading: Image.network(burger.imageUrl, width: 50),
                        title: Text(burger.name),
                        subtitle: Text(currencyFormatter.format(burger.price)),
                        trailing: IconButton(
                          icon: const Icon(Icons.add_shopping_cart),
                          onPressed: () {
                            context.read<CartBloc>().add(AddToCart(burger));
                          },
                        ),
                      ),
                    );
                  },
                );
              } else if (state is BurgerError) {
                return const Center(
                    child: Text('Erro ao carregar hambúrgueres.'));
              }
              return const SizedBox();
            },
          ),
        );
      },
    );
  }
}
