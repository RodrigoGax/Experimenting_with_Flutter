import 'package:flutter/material.dart';
import 'package:grocery_store/bloc/providers/grocery_provider.dart';
import 'package:grocery_store/pages/grocery_store_details.dart';
import 'package:grocery_store/widget/staggered_dual_view.dart';

import '../pages/grocery_store_home.dart';

class GroceryStoreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context).bloc;

    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.only(
          top: cartBarHeight, left: 10, right: 10, bottom: 10),
      child: StaggeredDualView(
          aspectRatio: 0.7,
          offsetPercent: 0.2,
          spacing: 10,
          itemBuilder: (context, index) {
            final product = bloc.catalog[index];
            // final item = bloc.cart[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 700),
                    pageBuilder: (context, animation, __) {
                      return FadeTransition(
                          child: GroceryStoreDetails(
                              product: product,
                              onProductAdded: () {
                                // bloc.incrementProduct(item);

                                bloc.addProduct(product);
                              }),
                          opacity: animation);
                    },
                  ),
                );
              },
              child: Card(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 10,
                shadowColor: Colors.black45,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Hero(
                              tag: 'list_${product.name}',
                              child: Center(
                                child: Image.asset(product.image,
                                    fit: BoxFit.contain),
                              ))),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                      SizedBox(height: 15),
                      Text(
                        '${product.name}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 14),
                      ),
                      Text(
                        '${product.weight}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: bloc.catalog.length),
    );
    // return ListView.builder(
    //   itemCount: bloc.catalog.length,
    //   itemBuilder: (context, index) {
    //     return Container(
    //         height: 100,
    //         width: 100,
    //         color: Colors.primaries[index % Colors.primaries.length]);
    //   },
    // );
  }
}
