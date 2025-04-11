import 'package:flutter/material.dart';

class ItemsModel extends ChangeNotifier {
  final List _shoppingItems = [
    [
      'Chocolate Cake',
      '10.00',
      'assets/images/choco_cake.png',
      Color(0xffD3BCB3),
      1,
    ],
    [
      'Carrot Cake',
      '15.00',
      'assets/images/carrot_cake.png',
      Color(0xffF5AE73),
      1,
    ],
    [
      'Strawberry Cake',
      '130.00',
      'assets/images/strawberry_cake.png',
      Color(0xffFDBDBE),
      1,
    ],
    [
      'Mocha Cake',
      '11.00',
      'assets/images/mocha_cake.png',
      Color(0xffE4CDB7),
      1,
    ],
    [
      'Blueberry Cheese Cake',
      '150.00',
      'assets/images/blueberry_cheese_cake.png',
      Color(0xffD4CAFE),
      1,
    ],
    [
      'Lemon Cheese Cake',
      '150.00',
      'assets/images/lemon_cheese_cake.png',
      Color(0xffFFE7B3),
      1,
    ],
    [
      'Tiramisu Cake',
      '160.00',
      'assets/images/tiramisu_cake.png',
      Color(0xffE4CDB7),
      1,
    ],
    [
      'Vanilla Cupcake',
      '90.00',
      'assets/images/vanilla_cupcake.png',
      Color(0xffD1F0FA),
      1,
    ],
  ];

  final List _cartItems = [];

  get shopItems => _shoppingItems;

  get cartItems => _cartItems;

  //viewmodel

  void addItemtoCart(int index) {
    if (!_cartItems.contains(_shoppingItems[index])) {
      _cartItems.add(_shoppingItems[index]);
      print('added to cart');
    } else
      print('already in cart');

    notifyListeners();
  }

  void removeItemtoCart(int index) {
    _cartItems.removeAt(index);
    calculateTotal();
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      double price = double.parse(_cartItems[i][1]);
      int quantity = _cartItems[i][4];
      totalPrice += price * quantity;
    }
    return totalPrice.toStringAsFixed(2);
  }

  void updateItemQuantity(int index, int quantity) {
    _cartItems[index][4] = quantity;
    notifyListeners();
  }
}
