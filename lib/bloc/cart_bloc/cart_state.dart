import 'package:ecommerce_burguers/models/cart_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItem> items;

  CartLoaded(this.items);

  @override
  List<Object?> get props => [items];
}

class CartError extends CartState {}
