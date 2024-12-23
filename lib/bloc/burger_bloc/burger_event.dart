import 'package:equatable/equatable.dart';

abstract class BurgerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadBurgers extends BurgerEvent {}
