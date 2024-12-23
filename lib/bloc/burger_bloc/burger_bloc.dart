import 'package:ecommerce_burguers/bloc/burger_bloc/burger_event.dart';

import 'burger_state.dart';
import '../../repositorys/burger_repsitory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BurgerBloc extends Bloc<BurgerEvent, BurgerBlocState> {
  final BurgerRepository burgerRepository;

  BurgerBloc(this.burgerRepository) : super(BurgerLoading()) {
    on<LoadBurgers>((event, emit) async {
      try {
        final burgers = burgerRepository.getBurgers();
        emit(BurgerLoaded(burgers));
      } catch (e) {
        emit(BurgerError());
      }
    });
  }
}
