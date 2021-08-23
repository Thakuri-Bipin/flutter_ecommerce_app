part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartFetched extends CartEvent {}

class CartAdded extends CartEvent {
  final CartModel cart;
  CartAdded({required this.cart});
}

class CartRemoved extends CartEvent {
  final CartModel cart;
  CartRemoved({required this.cart});
}
