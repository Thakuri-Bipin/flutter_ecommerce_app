import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerce_bloc/config/size_config/size_config.dart';
import 'package:ecommerce_bloc/constants/color_constants.dart';
import 'package:ecommerce_bloc/modules/details/screens/details_screen.dart';
import 'package:ecommerce_bloc/modules/home/models/product_model.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  });

  final double width, aspectRetio;
  final ProductModel product;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isTogglingFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width + 70,
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(12),
        vertical: getProportionateScreenWidth(12),
      ),
      margin: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: SizedBox(
          width: getProportionateScreenWidth(widget.width),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                DetailsScreen.routeName,
                // arguments: ProductDetailsArguments(product: widget.product),
                arguments: widget.product,
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1.02,
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Hero(
                      tag: widget.product.id.toString(),
                      child: Image.network(widget.product.images[0]),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.product.title,
                  style: TextStyle(color: Colors.black),
                  maxLines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.product.price}",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                      ),
                    ),
                    // InkWell(
                    //   borderRadius: BorderRadius.circular(50),
                    //   onTap: () {
                    //     // widget.product.toggleFavoriteStatus();

                    //     //int result = widget.productProvider.addToFavorites(product);

                    //     // 1 -> exists in favorite list
                    //     // 0 -> not is favorite list

                    //     // if (result == 1) {
                    //     //   ScaffoldMessenger.of(context).showSnackBar(
                    //     //     customSnackBar('Already in favorites list'),
                    //     //   );
                    //     // } else {
                    //     //   ScaffoldMessenger.of(context).showSnackBar(
                    //     //     customSnackBar('Added To Favorites'),
                    //     //   );
                    //     // }
                    //   },
                    //   child: _isTogglingFavorite == false
                    //       ? Container(
                    //           padding: EdgeInsets.all(
                    //               getProportionateScreenWidth(8)),
                    //           height: getProportionateScreenWidth(28),
                    //           width: getProportionateScreenWidth(28),
                    //           decoration: BoxDecoration(
                    //             color: widget.product.isFavourite
                    //                 ? kPrimaryColor.withOpacity(0.15)
                    //                 : kSecondaryColor.withOpacity(0.1),
                    //             shape: BoxShape.circle,
                    //           ),
                    //           child: SvgPicture.asset(
                    //             "assets/icons/Heart Icon_2.svg",
                    //             color: widget.product.isFavourite
                    //                 ? Color(0xFFFF4848)
                    //                 : Color(0xFFDBDEE4),
                    //           ),
                    //         )
                    //       : CircularProgressIndicator(),
                    // ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
