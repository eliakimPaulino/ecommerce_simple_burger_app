import 'package:equatable/equatable.dart';
import '/models/burger_model.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddToCart extends CartEvent {
  final Burger burger;

  AddToCart(this.burger);

  @override
  List<Object?> get props => [burger];
}

class RemoveFromCart extends CartEvent {
  final Burger burger;

  RemoveFromCart(this.burger);

  @override
  List<Object?> get props => [burger];
}

class ClearCart extends CartEvent {}
