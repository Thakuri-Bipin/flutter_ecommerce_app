import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_bloc/constants/products_list.dart';
import 'package:ecommerce_bloc/modules/home/models/category_model.dart';
import 'package:ecommerce_bloc/modules/home/models/product_model.dart';
import 'package:ecommerce_bloc/modules/home/repos/home_repository.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository homeRepository = HomeRepository();
  HomeBloc() : super(HomeInitial()) {
    print('home constructor');
    add(ProductFetched());
  }

  List<ProductModel> _productsList = [];
  List<CategoryModel> _categoryList = [];

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is ProductFetched) {
      yield ProductFetchInProgress();
      try {
        _productsList = await homeRepository.getProductsListFromRepository();
        _categoryList = createDistictCategories(_productsList);

        yield ProductFetchSuccess(
          products: _productsList,
          categoryList: _categoryList,
        );
      } catch (error) {
        yield ProductFetchFailure(message: 'Something went wrong!');
      }
    }
  }

  List<CategoryModel> createDistictCategories(plist) {
    List<String> lastCat = [];
    List<CategoryModel> catList = [];
    plist.forEach((element) {
      if (!lastCat.contains(element.category)) {
        catList.add(CategoryModel(
          title: element.category,
          img: element.images[0],
          id: element.id,
        ));
        lastCat.add(element.category);
      }
    });
    return catList;
  }
}
