import 'package:ecommerce_bloc/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_bloc/modules/cart/models/cart_model.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    required this.cart,
  });

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          child: Image.network(
            cart.product.images[0],
          ),
        ),
        title: Text(
          cart.product.title,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        subtitle: Text.rich(
          TextSpan(
            text: "\$${cart.product.price}",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: kPrimaryColor,
            ),
            children: [
              TextSpan(
                text: " x${cart.numOfItem}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
      // child: Row(
      //   children: [
      //     SizedBox(
      //       width: 88,
      //       child: AspectRatio(
      //         aspectRatio: 0.88,
      //         child: Container(
      //           padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      //           decoration: BoxDecoration(
      //             color: Color(0xFFF5F6F9),
      //             borderRadius: BorderRadius.circular(15),
      //           ),
      //           child: Image.network(cart.product.images[0]),
      //         ),
      //       ),
      //     ),
      //     SizedBox(width: 20),
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text(
      //           cart.product.title,
      //           style: TextStyle(color: Colors.black, fontSize: 16),
      //           maxLines: 2,
      //         ),
      //         SizedBox(height: 10),
      //         Text.rich(
      //           TextSpan(
      //             text: "\$${cart.product.price}",
      //             style: TextStyle(
      //                 fontWeight: FontWeight.w600, color: kPrimaryColor),
      //             children: [
      //               TextSpan(
      //                   text: " x${cart.numOfItem}",
      //                   style: Theme.of(context).textTheme.bodyText1),
      //             ],
      //           ),
      //         )
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}
