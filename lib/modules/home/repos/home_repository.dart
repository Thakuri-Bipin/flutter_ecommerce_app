import 'package:ecommerce_bloc/constants/api_paths.dart';
import 'package:ecommerce_bloc/modules/home/models/product_model.dart';

class HomeRepository {
  Future<List<ProductModel>> getProductsListFromRepository() async {
    MainProductsApiProvider? mainProductsApiProvider =
        MainProductsApiProvider();
    return mainProductsApiProvider.getProductsListFromApi();
  }
}
