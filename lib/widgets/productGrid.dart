import 'package:flutter/material.dart';
import '../widgets/product_lists.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';

class ProductsGrid extends StatelessWidget {
  final bool showOnlyFavorites;
  ProductsGrid(this.showOnlyFavorites);
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = showOnlyFavorites ? productData.favItem:productData.items;
    return GridView.builder(
      itemCount: products.length,
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 2,
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        //create: (c)=>products[index], // use .value everywhere except root provider
        value: products[index],
        child: ProductList(
            // products[index].id,
            // products[index].title,
            // products[index].imageUrl
            ),
      ),
    );
  }
}
