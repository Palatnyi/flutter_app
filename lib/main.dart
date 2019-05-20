import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scoped_model/scoped_model.dart';
import 'pages/products.dart';
import 'pages/products_management.dart';
import 'pages/auth.dart';
import 'pages/product.dart';

import 'models/product.dart';

import './scoped_models/product_model.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<ProductModel>(
        model: ProductModel(),
        child: MaterialApp(
          // debugShowMaterialGrid: true,
          theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              accentColor: Colors.deepPurple,
              brightness: Brightness.light),
          // home: AuthPage(),
          routes: {
            '/': (BuildContext context) => AuthPage(),
            '/products': (BuildContext context) => ProductsPage(),
            '/products-management': (BuildContext context) => ProductsManagement()
          },
          onGenerateRoute: (RouteSettings settings) {
            final List<String> pathElements = settings.name.split('/');

            if (pathElements[0] != '') {
              return null;
            }

            if (pathElements[1] == 'product') {
              final int index = int.parse(pathElements[2]);
              return MaterialPageRoute<bool>(builder: (BuildContext context) {
                return ScopedModelDescendant<ProductModel>(builder:
                    (BuildContext context, Widget child, ProductModel model) {
                        Product _model = model.products[index];

                      return ProductPage(_model.title, _model.imageUrl, _model.description, _model.address, _model.price);
                });
              });
            }
            return null;
          },
        ));
  }
}
