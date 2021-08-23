import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:ecommerce_bloc/modules/home/models/product_model.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    print('favorite constructor');
    add(FavoriteFetched());
  }

  List<ProductModel> _favoriteList = [];
  List<ProductModel> get favoriteList => [..._favoriteList];

  @override
  Stream<FavoriteState> mapEventToState(
    FavoriteEvent event,
  ) async* {
    if (event is FavoriteFetched) {
      yield FavoriteFetchInProgress();
      try {
        yield FavoriteFetchSuccess(favoriteList: _favoriteList);
      } catch (e) {
        yield FavoriteFetchFailure(message: 'Something went wrong!');
      }
    }

    if (event is ProductAddedToFavorite) {
      yield FavoriteFetchInProgress();
      try {
        _favoriteList.add(event.product);
        yield FavoriteFetchSuccess(favoriteList: _favoriteList);
      } catch (e) {
        yield FavoriteFetchFailure(message: 'Something went wrong!');
      }
    }

    if (event is ProductRemovedFromFavorite) {
      yield FavoriteFetchInProgress();
      try {
        _favoriteList.remove(event.product);
        yield FavoriteFetchSuccess(favoriteList: _favoriteList);
      } catch (e) {
        yield FavoriteFetchFailure(message: 'Something went wrong!');
      }
    }
  }
}
