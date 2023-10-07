import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/orders_screen.dart';

import './providers/cart_items.dart';
import './providers/orders_details.dart';
import './providers/providers.dart';
import './screens/edit_product_list.dart';
import './screens/product_details_screen.dart';
import './screens/product_overview.dart';
import './screens/user_cart_screen.dart';
import 'screens/cartScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (ctx)=> Products(),),
        ChangeNotifierProvider(
        create: (ctx)=> Cart(),),
        ChangeNotifierProvider(
        create: (ctx)=> Orders(),),
      ],
 
          child:MaterialApp(
          title: 'Shop App',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
            textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              headline4: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName:(ctx)=>ProductDetailScreen(),
            CartScreen.routeName:(ctx)=>CartScreen(),
            OrdersScreen.routeName: (ctx)=>OrdersScreen(),
            ProductCart.routeName: (ctx)=>ProductCart(),
            EditProductListScreen.routeName:(ctx)=>EditProductListScreen(),
          },
          ),
    );
  }
}