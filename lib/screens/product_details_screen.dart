import 'package:flutter/material.dart';
import '../providers/providers.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-details';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadingData =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
        appBar: AppBar(
          title: Text(loadingData.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                width: double.infinity,
                child: Image.network(
                  loadingData.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text('₹${loadingData.price}',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.black54, fontSize: 30)),
              SizedBox(
                height: 10,
              ),
              Text(
                '${loadingData.description}',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.black, fontSize: 20),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
