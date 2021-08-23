import 'package:ecommerce_bloc/modules/favorite/bloc/favorite_bloc.dart';
import 'package:ecommerce_bloc/modules/home/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerce_bloc/config/size_config/size_config.dart';
import 'package:ecommerce_bloc/constants/color_constants.dart';
import 'package:ecommerce_bloc/modules/details/screens/details_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
      padding: EdgeInsets.only(
        //top: getProportionateScreenWidth(20.0),
        left: getProportionateScreenWidth(20.0),
        right: getProportionateScreenWidth(20.0),
      ),
      child: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteFetchInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is FavoriteFetchSuccess) {
            List<ProductModel> favorites = state.favoriteList;
            if (favorites.length < 1) {
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
                      'No favorites -- yet?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(30),
              ),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      BlocProvider.of<FavoriteBloc>(context).add(
                        ProductRemovedFromFavorite(
                          product: favorites[index],
                        ),
                      );
                    },
                    background: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Spacer(),
                          SvgPicture.asset("assets/icons/Trash.svg"),
                        ],
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          DetailsScreen.routeName,
                          arguments: favorites[index],
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F6F9),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Hero(
                              tag: favorites[index].id.toString(),
                              child: Image.network(
                                favorites[index].images[0],
                              ),
                            ),
                          ),
                          title: Text(
                            favorites[index].title,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          subtitle: Text.rich(
                            TextSpan(
                              text: "\$${favorites[index].price}",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor,
                              ),
                              children: [],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }

          if (state is FavoriteFetchFailure) {
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
                    state.message.toString(),
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            );
          }
          return CircularProgressIndicator();
        },
      ),
      // child: favorites.length > 0
      //     ? ListView.builder(
      //         padding: EdgeInsets.symmetric(
      //           vertical: getProportionateScreenHeight(30),
      //         ),
      //         itemCount: favorites.length,
      //         itemBuilder: (context, index) {
      //           return Padding(
      //             padding: EdgeInsets.symmetric(vertical: 10),
      //             child: Dismissible(
      //               key: UniqueKey(),
      //               direction: DismissDirection.endToStart,
      //               onDismissed: (direction) {
      //                 // productProvider.removeFromFavorites(favorites[index]);
      //               },
      //               background: Container(
      //                 padding: EdgeInsets.symmetric(horizontal: 20.0),
      //                 decoration: BoxDecoration(
      //                   color: Color(0xFFFFE6E6),
      //                   borderRadius: BorderRadius.circular(15),
      //                 ),
      //                 child: Row(
      //                   children: [
      //                     Spacer(),
      //                     SvgPicture.asset("assets/icons/Trash.svg"),
      //                   ],
      //                 ),
      //               ),
      //               child: InkWell(
      //                 onTap: () {
      //                   // Navigator.pushNamed(
      //                   //   context,
      //                   //   DetailsScreen.routeName,
      //                   //   arguments: ProductDetailsArguments(
      //                   //     product: favorites[index],
      //                   //   ),
      //                   // );
      //                 },
      //                 child: Container(
      //                   padding: const EdgeInsets.all(10.0),
      //                   decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     borderRadius: BorderRadius.circular(12.0),
      //                   ),
      //                   child: ListTile(
      //                     leading: Container(
      //                       decoration: BoxDecoration(
      //                         color: Color(0xFFF5F6F9),
      //                         borderRadius: BorderRadius.circular(15),
      //                       ),
      //                       child: Hero(
      //                         tag: favorites[index].id.toString(),
      //                         child: Image.network(
      //                           favorites[index].images[0],
      //                         ),
      //                       ),
      //                     ),
      //                     title: Text(
      //                       favorites[index].title,
      //                       style: TextStyle(color: Colors.black, fontSize: 16),
      //                     ),
      //                     subtitle: Text.rich(
      //                       TextSpan(
      //                         text: "\$${favorites[index].price}",
      //                         style: TextStyle(
      //                           fontWeight: FontWeight.w600,
      //                           color: kPrimaryColor,
      //                         ),
      //                         children: [],
      //                       ),
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
      //               'No favorites -- yet?',
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

//   child: Container(
//     padding: const EdgeInsets.all(10.0),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(12.0),
//     ),
//     child: Row(
//       children: [
//         SizedBox(
//           width: 88,
//           child: AspectRatio(
//             aspectRatio: 0.88,
//             child: Container(
//               padding: EdgeInsets.all(
//                 getProportionateScreenWidth(10),
//               ),
//               decoration: BoxDecoration(
//                 color: Color(0xFFF5F6F9),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Hero(
//                 tag: favorites[index].id.toString(),
//                 child:
//                     Image.asset(favorites[index].images[0]),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(width: 20),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               favorites[index].title,
//               style: TextStyle(
//                   color: Colors.black, fontSize: 16),
//               maxLines: 2,
//             ),
//             SizedBox(height: 10),
//             Text.rich(
//               TextSpan(
//                 text: "\$${favorites[index].price}",
//                 style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     color: kPrimaryColor),
//                 children: [
//                   // TextSpan(
//                   //     text: " x${demoCarts[index].numOfItem}",
//                   //     style: Theme.of(context).textTheme.bodyText1),
//                 ],
//               ),
//             )
//           ],
//         )
//       ],
//     ),
//   ),
// ),
