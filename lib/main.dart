import 'package:ecommerce_burguers/bloc/burger_bloc/burger_bloc.dart';
import 'package:ecommerce_burguers/bloc/burger_bloc/burger_event.dart';
import 'package:ecommerce_burguers/bloc/cart_bloc/cart_bloc.dart';
import 'package:ecommerce_burguers/bloc/login_bloc/login_bloc.dart';
import 'package:ecommerce_burguers/repositorys/burger_repsitory.dart';
import 'package:ecommerce_burguers/screens/cart_screen.dart';
import 'package:ecommerce_burguers/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) =>
              BurgerBloc(BurgerRepository())..add(LoadBurgers()),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce Burgers',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/cart': (context) => CartScreen(),
        },
      ),
    );
  }
}
