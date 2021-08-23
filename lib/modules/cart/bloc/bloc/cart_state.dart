part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartFetchInProgress extends CartState {}

class CartFetchSuccess extends CartState {
  final List<CartModel> cart;
  CartFetchSuccess({required this.cart});
}

class CartFetchFailure extends CartState {
  final String message;
  CartFetchFailure({required this.message});
}
