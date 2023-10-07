import 'package:flutter/material.dart';
import 'package:shop_app/widgets/drawer.dart';
import '../widgets/orders_list.dart';
import 'package:provider/provider.dart';
import '../providers/orders_details.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/Orders';
  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => OrdersList(ordersData.orders[i]),
        itemCount: ordersData.orders.length,
      ),
      drawer: AppDrawer(),
    );
  }
}
