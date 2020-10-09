import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:io' show Platform;

import 'package:flutter_svg/flutter_svg.dart';

import 'package:grocery_store/bloc/providers/grocery_provider.dart';
import 'package:grocery_store/utils/responsive.dart';

class GroceryStoreCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context).bloc;
    final responsive = Responsive.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: bloc.cart.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Carrito',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: bloc.cart.length,
                                itemBuilder: (context, index) {
                                  final item = bloc.cart[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          backgroundImage:
                                              AssetImage(item.product.image),
                                        ),
                                        const SizedBox(width: 15),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xFFF4C459),
                                              borderRadius:
                                                  BorderRadius.circular(25.0)),
                                          child: Row(
                                            children: [
                                              item.quantity > 1
                                                  ? IconButton(
                                                      iconSize: 15,
                                                      onPressed: () {
                                                        bloc.removeProduct(
                                                            item.product);
                                                      },
                                                      icon: Icon(Icons.remove,
                                                          color: Colors.black),
                                                    )
                                                  : IconButton(
                                                      iconSize: 15,
                                                      onPressed: () {
                                                        showDialog(
                                                            context: context,
                                                            barrierDismissible:
                                                                true,
                                                            builder: (context) {
                                                              return Platform
                                                                      .isAndroid
                                                                  ? AlertDialog(
                                                                      title: Text(
                                                                          'Eliminar del carrito'),
                                                                      content: Text(
                                                                          '¿Desea eliminar este producto del carrito?'),
                                                                      actions: <
                                                                          Widget>[
                                                                        FlatButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Text('No')),
                                                                        FlatButton(
                                                                            onPressed:
                                                                                () {
                                                                              bloc.deleteProduct(item);
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Text('Sí')),
                                                                      ],
                                                                    )
                                                                  : CupertinoAlertDialog(
                                                                      title: Text(
                                                                          'Eliminar del carrito'),
                                                                      content: Text(
                                                                          '¿Desea eliminar este producto del carrito?'),
                                                                      actions: <
                                                                          Widget>[
                                                                        FlatButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Text('No')),
                                                                        FlatButton(
                                                                            onPressed:
                                                                                () {
                                                                              bloc.deleteProduct(item);
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Text('Sí')),
                                                                      ],
                                                                    );
                                                            });
                                                        // AlertDialog(
                                                        //   title: Text(
                                                        //       'Eliminar del carrito'),
                                                        //   content: Text(
                                                        //       '¿Desea eliminar este producto del carrito?'),
                                                        // );
                                                        // bloc.deleteProduct(item);
                                                      },
                                                      icon: Icon(Icons.delete,
                                                          color: Colors.black),
                                                    ),
                                              Text(
                                                item.quantity.toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                              ),
                                              IconButton(
                                                iconSize: 15,
                                                onPressed: () {
                                                  bloc.addProduct(item.product);
                                                },
                                                icon: Icon(Icons.add,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Container(
                                        //   width: 25,
                                        //   height: 25,
                                        //   decoration: BoxDecoration(
                                        //       color: Color(0xFFF4C459),
                                        //       borderRadius:
                                        //           BorderRadius.circular(4.0)),
                                        //   child: item.quantity > 1
                                        //       ? Icon(Icons.remove,
                                        //           color: Colors.white, size: 25)
                                        //       : Icon(Icons.delete,
                                        //           color: Colors.white, size: 22),
                                        // ),
                                        // const SizedBox(width: 10),
                                        // Text(
                                        //   item.quantity.toString(),
                                        //   style: TextStyle(color: Colors.white),
                                        // ),
                                        // const SizedBox(width: 10),
                                        // Container(
                                        //   width: 25,
                                        //   height: 25,
                                        //   decoration: BoxDecoration(
                                        //       color: Color(0xFFF4C459),
                                        //       borderRadius:
                                        //           BorderRadius.circular(4.0)),
                                        //   child: Icon(Icons.add,
                                        //       color: Colors.white, size: 25),
                                        // ),
                                        const SizedBox(width: 15),
                                        Text(
                                          item.product.name,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Spacer(),
                                        Text(
                                          '\$${(item.product.price * item.quantity).toStringAsFixed(2)}',
                                          style:
                                              TextStyle(color: Colors.white54),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, left: 2),
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                  child: Icon(
                                    Icons.local_shipping,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  'Envío',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Spacer(),
                                Text(
                                  '\$15.00',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Text(
                        'Total:',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Text(
                        '\$${(bloc.totalPriceElements() + 15).toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: RaisedButton(
                      color: Color(0xFFF4C459),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          'Siguiente',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      onPressed: () => null),
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'El carrito se encuentra vacío.',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: responsive.porcentajeDiagonal(3)),
                    ),
                    Text(
                      '¡Regrese a comprar!',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: responsive.porcentajeDiagonal(3)),
                    ),
                    SizedBox(height: responsive.porcentajeDiagonal(3)),
                    SvgPicture.asset(
                      'assets/undraw_empty_cart_co35.svg',
                      height: responsive.porcentajeDiagonal(35),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
