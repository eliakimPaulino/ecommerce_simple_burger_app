import 'package:equatable/equatable.dart';
import '../../models/burger_model.dart';

abstract class BurgerBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BurgerLoading extends BurgerBlocState {}

class BurgerLoaded extends BurgerBlocState {
  final List<Burger> burgers;

  BurgerLoaded(this.burgers);

  @override
  List<Object?> get props => [burgers];
}

class BurgerError extends BurgerBlocState {}
