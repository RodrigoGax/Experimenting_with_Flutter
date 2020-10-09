import 'package:flutter/material.dart';
import 'package:grocery_store/bloc/grocery_store_bloc.dart';
import 'package:grocery_store/bloc/providers/grocery_provider.dart';
import 'package:grocery_store/models/grocery_product.dart';
import 'package:grocery_store/pages/grocery_store_home.dart';
import 'package:grocery_store/utils/responsive.dart';

class GroceryStoreDetails extends StatefulWidget {
  final GroceryProduct product;
  final VoidCallback onProductAdded;

  const GroceryStoreDetails(
      {Key key, @required this.product, this.onProductAdded})
      : super(key: key);

  @override
  _GroceryStoreDetailsState createState() => _GroceryStoreDetailsState();
}

class _GroceryStoreDetailsState extends State<GroceryStoreDetails> {
  String heroTag = '';

  get product => null;

  @override
  Widget build(BuildContext context) {
    // final product = GroceryProduct();
    // final bloc = GroceryProvider.of(context).bloc;

    final item = GroceryProductItem(product: product);

    final responsive = Responsive.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Hero(
                      tag: 'list_${widget.product.name}$heroTag',
                      child: Image.asset(
                        widget.product.image,
                        fit: BoxFit.cover,
                        height: responsive.porcentajeAltura(27),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.product.name,
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.product.weight,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: responsive.porcentajeAnchura(2)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '\$${widget.product.price.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Row(
                  //   children: [
                  //     Container(
                  //       decoration: BoxDecoration(
                  //           color: Color(0xFFD5D3CF),
                  //           borderRadius: BorderRadius.circular(25.0)),
                  //       child: Row(
                  //         children: [
                  //           IconButton(
                  //             iconSize: 15,
                  //             onPressed: () => null,
                  //             icon: Icon(Icons.remove, color: Colors.black),
                  //           ),
                  //           Text(
                  //             item.quantity.toString(),
                  //             style:
                  //                 TextStyle(color: Colors.black, fontSize: 12),
                  //           ),
                  //           IconButton(
                  //             iconSize: 15,
                  //             onPressed: () {
                  //               print(item.quantity);

                  //               bloc.incrementProduct(item);
                  //             },
                  //             icon: Icon(Icons.add, color: Colors.black),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Spacer(),
                  //     Text(
                  //       '\$${widget.product.price.toStringAsFixed(2)}',
                  //       style: Theme.of(context).textTheme.headline4.copyWith(
                  //           color: Colors.black, fontWeight: FontWeight.bold),
                  //     ),
                  //   ],
                  // ),

                  // SizedBox(height: responsive.porcentajeDiagonal(4)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Acerca del producto',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: responsive.porcentajeDiagonal(3)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SingleChildScrollView(
                      child: Text(
                        widget.product.description,
                        // overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: responsive.porcentajeDiagonal(1.8),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Container(
                  width: responsive.porcentajeAnchura(13),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55.0),
                      color: Color(0xFFD5D3CF),
                    ),
                    child: IconButton(
                        iconSize: 20,
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                        ),
                        onPressed: () => null),
                  ),
                ),
                Spacer(),
                Container(
                  width: responsive.porcentajeAnchura(70),
                  child: RaisedButton(
                      color: Color(0xFFF4C459),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          'Agregar al carrito',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      onPressed: () => _addToCart(context)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _addToCart(BuildContext context) {
    setState(() {
      heroTag = 'details';
    });
    widget.onProductAdded();
    Navigator.of(context).pop();
  }
}
