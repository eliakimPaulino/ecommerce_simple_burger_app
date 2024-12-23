import '../models/burger_model.dart';

class BurgerRepository {
  final List<Burger> _burgers = const [
    Burger(
      id: '1',
      name: 'Classic Burger',
      price: 9.99,
      imageUrl:
          'https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg?auto=compress&cs=tinysrgb&w=400',
    ),
    Burger(
      id: '2',
      name: 'Cheese Burger',
      price: 11.99,
      imageUrl:
          'https://images.pexels.com/photos/4109240/pexels-photo-4109240.jpeg?auto=compress&cs=tinysrgb&w=400',
    ),
    Burger(
      id: '3',
      name: 'Bacon Burger',
      price: 13.99,
      imageUrl:
          'https://images.pexels.com/photos/3630141/pexels-photo-3630141.jpeg?auto=compress&cs=tinysrgb&w=400',
    ),
  ];

  List<Burger> getBurgers() {
    return _burgers;
  }
}
