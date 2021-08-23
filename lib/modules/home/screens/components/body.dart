import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_bloc/config/size_config/size_config.dart';
import 'package:ecommerce_bloc/modules/home/bloc/bloc/home_bloc.dart';
import 'package:ecommerce_bloc/modules/home/screens/components/categories.dart';
import 'package:ecommerce_bloc/modules/home/screens/components/discount_banner.dart';
import 'package:ecommerce_bloc/modules/home/screens/components/home_header.dart';
import 'package:ecommerce_bloc/modules/home/screens/components/product_categories.dart';
import 'package:ecommerce_bloc/modules/home/screens/components/special_offers.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: getProportionateScreenHeight(20)),
        HomeHeader(),
        SizedBox(height: getProportionateScreenWidth(10)),
        DiscountBanner(),
        Categories(),
        SpecialOffers(),
        SizedBox(height: getProportionateScreenWidth(20)),
        BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            // var snackBar = SnackBar(
            //   content: Text(state.toString()),
            // );
            // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          builder: (context, state) {
            if (state is ProductFetchInProgress) {
              return Container(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductFetchSuccess) {
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.categoryList.length,
                itemBuilder: (BuildContext context, index) => ProductCategories(
                  productCategory: state.categoryList[index].title,
                  products: state.products
                      .where((element) =>
                          element.category == state.categoryList[index].title)
                      .toList(),
                ),
              );
              //return Text(state.products[0].title.toString());
            }

            if (state is ProductFetchFailure) {
              return Center(
                child: Text(
                  'status: ${state.message}',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            return Container(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          },
        ),
        SizedBox(height: getProportionateScreenWidth(30)),
      ],
    );
  }

  // @override
  // void dispose() {
  //   BlocProvider.of<HomeBloc>(context).close();
  //   print('closeddd');
  //   super.dispose();
  // }
}
