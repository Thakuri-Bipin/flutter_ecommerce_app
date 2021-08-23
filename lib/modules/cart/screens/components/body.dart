import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:ecommerce_bloc/config/size_config/size_config.dart';
import 'package:ecommerce_bloc/modules/cart/bloc/bloc/cart_bloc.dart';
import 'package:ecommerce_bloc/modules/cart/screens/components/cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(
        // top: getProportionateScreenWidth(20.0),
        left: getProportionateScreenWidth(20.0),
        right: getProportionateScreenWidth(20.0),
      ),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60.0),
          topRight: Radius.circular(60.0),
        ),
      ),
      child: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          //print(state);
        },
        builder: (context, state) {
          if (state is CartFetchInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is CartFetchSuccess) {
            //  print('state cart length');
            // print(state.cart.length);
            if (state.cart.isEmpty) {
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
                      'No shopping -- yet?',
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
              itemCount: state.cart.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    BlocProvider.of<CartBloc>(
                      context,
                      listen: false,
                    ).add(
                      CartRemoved(cart: state.cart[index]),
                    );
                    // context
                    //     .read<CartBloc>()
                    //     .add(CartRemoved(cart: state.cart[index]));
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                  child: CartCard(cart: state.cart[index]),
                ),
              ),
            );
          }

          if (state is CartFetchFailure) {
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
      ),
    );
  }
}
