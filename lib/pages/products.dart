import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main_model.dart';
import '../widgets/products/products.dart';

class ProductsPage extends StatefulWidget {
  final MainModel model;
  ProductsPage({this.model});

  @override
  State<ProductsPage> createState() {
    // TODO: implement build
    return _ProductsPageState();
  }
}

class _ProductsPageState extends State<ProductsPage> {
  void initState() {
    widget.model.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
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
              icon: model.displayFavourites
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
              onPressed: () {
                model.toggleDisplayMode();
              },
            )
          ],
        ),
        body: Products(products: model.products),
      );
    });
  }
}
