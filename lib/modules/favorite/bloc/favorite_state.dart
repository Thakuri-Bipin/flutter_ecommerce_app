part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteFetchInProgress extends FavoriteState {}

class FavoriteFetchSuccess extends FavoriteState {
  final List<ProductModel> favoriteList;
  FavoriteFetchSuccess({required this.favoriteList});
}

class FavoriteFetchFailure extends FavoriteState {
  final String message;
  FavoriteFetchFailure({required this.message});
}
