import 'package:flutter/material.dart';
import 'pages/products.dart';
import 'pages/products_management.dart';
// import 'pages/auth.dart';
import 'pages/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
    print('products $_products');
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
    print(_products);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowMaterialGrid: true,
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
          brightness: Brightness.light),
      // home: AuthPage(),
      routes: {
        '/': (BuildContext context) => ProductsPage(
              products: _products,
            ),
        '/products-management': (BuildContext context) => ProductsManagement(
              _addProduct,
              _deleteProduct
            )
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');

        if (pathElements[0] != '') {
          return null;
        }

        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(builder: (BuildContext context) {
            return ProductPage(
                _products[index]['title'], _products[index]['image']);
          });
        }
        return null;
      },
    );
  }
}
