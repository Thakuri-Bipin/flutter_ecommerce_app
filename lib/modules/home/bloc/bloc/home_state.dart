part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ProductFetchSuccess extends HomeState {
  final List<ProductModel> products;
  final List<CategoryModel> categoryList;
  ProductFetchSuccess({required this.products, required this.categoryList});
}

class ProductFetchInProgress extends HomeState {}

class ProductFetchFailure extends HomeState {
  final String message;
  ProductFetchFailure({required this.message});
}
