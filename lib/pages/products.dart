import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/product_model.dart';
import '../models/product.dart';
import '../widgets/products/products.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage();
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductModel>(
      builder: (BuildContext context, Widget child, ProductModel model) {
        return Scaffold(
          drawer: Drawer(
            child: Column(children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Choose'),
              ),
              ListTile(
                trailing: Icon(Icons.edit),
                title: Text('manage products'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/products-management');
                },
              )
            ]),
          ),
          appBar: AppBar(
            title: Text('home page'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {},
              )
            ],
          ),
          body: Products(products: model.products),
        );
    });
  }
}
