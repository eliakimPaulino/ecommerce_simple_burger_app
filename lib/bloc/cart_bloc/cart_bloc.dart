import 'package:bloc/bloc.dart';
import 'package:ecommerce_burguers/bloc/cart_bloc/cart_event.dart';
import 'package:ecommerce_burguers/bloc/cart_bloc/cart_state.dart';
import 'package:ecommerce_burguers/models/cart_item_model.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<AddToCart>((event, emit) {
      if (state is CartLoaded) {
        final currentState = state as CartLoaded;
        final items = List<CartItem>.from(currentState.items);

        final index =
            items.indexWhere((item) => item.burger.id == event.burger.id);
        if (index != -1) {
          items[index] =
              items[index].copyWith(quantity: items[index].quantity + 1);
        } else {
          items.add(CartItem(burger: event.burger));
        }

        emit(CartLoaded(items));
      } else {
        emit(CartLoaded([CartItem(burger: event.burger)]));
      }
    });

    on<RemoveFromCart>((event, emit) {
      if (state is CartLoaded) {
        final currentState = state as CartLoaded;
        final items = currentState.items
            .where((item) => item.burger.id != event.burger.id)
            .toList();
        emit(CartLoaded(items));
      }
    });

    on<ClearCart>((event, emit) {
      emit(CartLoaded([]));
    });
  }
}
