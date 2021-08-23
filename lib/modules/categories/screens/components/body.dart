import 'package:ecommerce_bloc/modules/category_products/screens/category_products_screen.dart';
import 'package:ecommerce_bloc/modules/home/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerce_bloc/config/size_config/size_config.dart';
import 'package:ecommerce_bloc/modules/home/bloc/bloc/home_bloc.dart';
import 'package:ecommerce_bloc/modules/home/models/category_model.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // final List categories = [
  //   {'title': 'Books', 'img': 'assets/images/splash_1.png'},
  //   {'title': 'Sports', 'img': 'assets/images/splash_2.png'},
  //   {'title': 'Phones', 'img': 'assets/images/splash_1.png'},
  //   {'title': 'Groceries', 'img': 'assets/images/splash_3.png'},
  //   {'title': 'Fashion', 'img': 'assets/images/shoes2.png'},
  //   {'title': 'Fashion', 'img': 'assets/images/shoes2.png'},
  //   {'title': 'Fashion', 'img': 'assets/images/shoes2.png'},
  //   {'title': 'Fashion', 'img': 'assets/images/shoes2.png'},
  //   {'title': 'Fashion', 'img': 'assets/images/shoes2.png'},
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60.0),
            topRight: Radius.circular(60.0),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20.0),
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is ProductFetchInProgress) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ProductFetchSuccess) {
              List<CategoryModel> categoryList = state.categoryList;
              List<ProductModel> productList = state.products;

              if (categoryList.isEmpty) {
                return Center(
                  child: Container(
                    width: getProportionateScreenWidth(150),
                    height: getProportionateScreenHeight(50),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: Text(
                        'No Categores -- yet!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                );
              }

              return GridView.builder(
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(30),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  //childAspectRatio: 3 / 2,
                  crossAxisSpacing: 35,
                  mainAxisSpacing: 35,
                ),
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  List<ProductModel> products = productList
                      .where((element) =>
                          element.category == categoryList[index].title)
                      .toList();
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        CategoryProductsScreen.routeName,
                        arguments: CategoryProductsArguments(
                          products: products,
                          category: categoryList[index].title,
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Container(
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: getProportionateScreenWidth(60),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F6F9),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Hero(
                                    tag: categoryList[index].id.toString(),
                                    child: Image.network(
                                      categoryList[index].img,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  categoryList[index].title,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            if (state is ProductFetchFailure) {
              return Center(
                child: Container(
                  width: getProportionateScreenWidth(150),
                  height: getProportionateScreenHeight(50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Center(
                    child: Text(
                      'Something went wrong!',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        )
        // child: productProvider.categories.length > 0
        //     ? GridView.builder(
        //         padding: EdgeInsets.symmetric(
        //           vertical: getProportionateScreenHeight(30),
        //         ),
        //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 2,
        //           //childAspectRatio: 3 / 2,
        //           crossAxisSpacing: 35,
        //           mainAxisSpacing: 35,
        //         ),
        //         itemCount: productProvider.categories.length,
        //         itemBuilder: (context, index) {
        //           List<Product> products = productProvider.products
        //               .where((element) =>
        //                   element.category ==
        //                   productProvider.categories[index].title)
        //               .toList();
        //           return InkWell(
        //             onTap: () {
        //               Navigator.pushNamed(
        //                 context,
        //                 CategoryProductsScreen.routeName,
        //                 arguments: CategoryProductsArguments(
        //                   products: products,
        //                   category: productProvider.categories[index].title,
        //                 ),
        //               );
        //             },
        //             child: Container(
        //               decoration: BoxDecoration(
        //                 color: Colors.white,
        //                 borderRadius: BorderRadius.circular(12.0),
        //               ),
        //               child: Container(
        //                 child: Center(
        //                   child: SingleChildScrollView(
        //                     child: Column(
        //                       mainAxisAlignment: MainAxisAlignment.center,
        //                       crossAxisAlignment: CrossAxisAlignment.center,
        //                       children: [
        //                         Container(
        //                           width: getProportionateScreenWidth(60),
        //                           decoration: BoxDecoration(
        //                             color: Color(0xFFF5F6F9),
        //                             borderRadius: BorderRadius.circular(15),
        //                           ),
        //                           child: Hero(
        //                             tag: productProvider.categories[index].id
        //                                 .toString(),
        //                             child: Image.network(
        //                                 productProvider.categories[index].img),
        //                           ),
        //                         ),
        //                         SizedBox(width: 20),
        //                         Text(
        //                           productProvider.categories[index].title,
        //                           style: TextStyle(
        //                               color: Colors.black, fontSize: 16),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           );
        //         },
        //       )
        //     : Center(
        //         child: Container(
        //           width: getProportionateScreenWidth(150),
        //           height: getProportionateScreenHeight(50),
        //           decoration: BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.circular(12.0),
        //           ),
        //           child: Center(
        //             child: Text(
        //               'No Categores -- yet!',
        //               style: TextStyle(
        //                 color: Colors.black,
        //                 fontSize: 16.0,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        );
  }
}
