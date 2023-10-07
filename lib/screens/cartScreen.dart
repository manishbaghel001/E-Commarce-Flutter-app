import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/cart_inner_list.dart';
import '../providers/cart_items.dart';
import '../providers/orders_details.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/Cart_screen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Total:',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 25, fontWeight: FontWeight.normal)),
                  Spacer(),
                  Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text(
                      '₹${(cart.getTotal).toStringAsFixed(2)}',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontSize: 20),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false)
                          .addOrder(cart.items.values.toList(), cart.getTotal);
                      cart.clear();
                    },
                    child: Text('Order Now',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor)),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartInnerList(
                  cart.items.values.toList()[i].id,
                  cart.items.keys.toList()[i],
                  cart.items.values.toList()[i].title,
                  cart.items.values.toList()[i].price,
                  cart.items.values.toList()[i].quantity),
            ),
          ),
        ],
      ),
    );
  }
}
