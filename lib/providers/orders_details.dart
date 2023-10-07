import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart_items.dart';
import '../providers/cart_items.dart';

class OrderItems {
  final String id;
  final double amount;
  final List<CartList> products;
  final DateTime dateTime;

  OrderItems(
      {@required this.id,
      @required this.amount,
      @required this.products,
      @required this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderItems> _orders = [];

  List<OrderItems> get orders {
    return [..._orders];
  }

  void addOrder(List<CartList> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItems(
        id: DateTime.now().toString(),
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
