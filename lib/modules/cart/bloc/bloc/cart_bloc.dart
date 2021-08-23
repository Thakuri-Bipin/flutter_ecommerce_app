import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_bloc/modules/cart/models/cart_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    print('cart constructor');
    add(CartFetched());
  }

  List<CartModel> _cart = [];
  List<CartModel> get cart => [..._cart];

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is CartFetched) {
      try {
        yield CartFetchInProgress();
        yield CartFetchSuccess(cart: _cart);
      } catch (e) {
        yield CartFetchFailure(message: 'Something went wrong!');
      }
    }

    if (event is CartAdded) {
      try {
        yield CartFetchInProgress();
        _cart.add(event.cart);
        yield CartFetchSuccess(cart: _cart);
      } catch (e) {
        yield CartFetchFailure(message: 'Something went wrong!');
      }
    }

    if (event is CartRemoved) {
      try {
        yield CartFetchInProgress();
        _cart.remove(event.cart);
        yield CartFetchSuccess(cart: _cart);
      } catch (e) {
        yield CartFetchFailure(message: 'Something went wrong!');
      }
    }
  }
}
