import 'package:flutter/material.dart';
import 'package:grocery_store/models/grocery_product.dart';

enum GroceryState {
  normal,
  details,
  cart,
}

class GroceryStoreBLoC with ChangeNotifier {
  GroceryState groceryState = GroceryState.normal;
  List<GroceryProduct> catalog = List.unmodifiable(groceryProducts);
  List<GroceryProductItem> cart = [];

  void changeToNormal() {
    groceryState = GroceryState.normal;
    notifyListeners();
  }

  void changeToCart() {
    groceryState = GroceryState.cart;
    notifyListeners();
  }

  void addProduct(GroceryProduct product) {
    for (GroceryProductItem item in cart) {
      if (item.product.name == product.name) {
        item.increment();
        notifyListeners();
        return;
      }
    }
    cart.add(GroceryProductItem(product: product));
    notifyListeners();
  }

  void incrementProduct(GroceryProductItem item) {
    item.increment();
    // cart.add(GroceryProductItem(product: product));

    notifyListeners();
    return;
  }

  void removeProduct(GroceryProduct product) {
    for (GroceryProductItem item in cart) {
      if (item.product.name == product.name) {
        item.decrement();
        notifyListeners();
        return;
      }
    }
    cart.add(GroceryProductItem(product: product));
    notifyListeners();
  }

  void deleteProduct(GroceryProductItem productItem) {
    cart.remove(productItem);
    notifyListeners();
  }

  int totalCartElements() => cart.fold<int>(
      0, (previousValue, element) => previousValue + element.quantity);

  double totalPriceElements() => cart.fold<double>(
      0.0,
      (previousValue, element) =>
          previousValue + (element.quantity * element.product.price));
}

class GroceryProductItem {
  int quantity;
  final GroceryProduct product;

  GroceryProductItem({this.quantity = 1, @required this.product});

  void increment() {
    quantity++;
  }

  void decrement() {
    quantity--;
  }
}
