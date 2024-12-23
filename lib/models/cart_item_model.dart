import 'burger_model.dart';

class CartItem {
  final Burger burger;
  final int quantity;

  CartItem({required this.burger, this.quantity = 1});

  CartItem copyWith({Burger? burger, int? quantity}) {
    return CartItem(
      burger: burger ?? this.burger,
      quantity: quantity ?? this.quantity,
    );
  }
}
