part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}

class FavoriteFetched extends FavoriteEvent {}

class ProductAddedToFavorite extends FavoriteEvent {
  final ProductModel product;
  ProductAddedToFavorite({required this.product});
}

class ProductRemovedFromFavorite extends FavoriteEvent {
  final ProductModel product;
  ProductRemovedFromFavorite({required this.product});
}
