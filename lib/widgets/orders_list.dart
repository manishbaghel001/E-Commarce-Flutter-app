import 'dart:math';
import 'package:flutter/material.dart';
import '../providers/orders_details.dart' as ord;
import 'package:intl/intl.dart';

class OrdersList extends StatefulWidget {
  final ord.OrderItems orders;
  OrdersList(this.orders);

  @override
  _OrdersListState createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('₹${widget.orders.amount}'),
            subtitle: Text(
                DateFormat('dd MM yyyy hh:mm').format(widget.orders.dateTime)),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                   _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              height: min(widget.orders.products.length * 20.0 + 100.0, 100.0),
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                children: widget.orders.products.map((prod) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(prod.title,style: TextStyle(fontSize: 20,color: Colors.black.withOpacity(0.75)),),
                        Text('${prod.quantity}x ₹${prod.price}',style: TextStyle(fontSize: 20,color: Colors.grey)),
                      ],
                    )).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
