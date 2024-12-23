import 'package:equatable/equatable.dart';

class Burger extends Equatable {
  final String id;
  final String name;
  final double price;
  final String imageUrl;

  const Burger({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, price, imageUrl];
}
