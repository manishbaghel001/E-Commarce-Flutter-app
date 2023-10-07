import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/edit_product_list.dart';
import '../providers/providers.dart';
import '../widgets/user_product_List.dart';
import '../widgets/drawer.dart';
import '../screens/edit_product_list.dart';

class ProductCart extends StatelessWidget {
  static const routeName = '/ProductList';
  @override
  Widget build(BuildContext context) {
    final productId = Provider.of<Products>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Product List'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProductListScreen.routeName);
              }),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (_, i) => Column(
            children: <Widget>[
              UserProductList(
                productId.items[i].id,
                  productId.items[i].title, productId.items[i].imageUrl,),
              Divider(),
            ],
          ),
          itemCount: productId.items.length,
        ),
      ),
    );
  }
}
