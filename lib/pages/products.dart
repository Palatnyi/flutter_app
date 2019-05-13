import 'package:flutter/material.dart';
import '../product_manager.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function deleteProduct;
  final Function addProduct;

  ProductsPage({this.products = const [], this.deleteProduct, this.addProduct});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            title: Text('manage products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/products-management');
            },
          )
        ]),
      ),
      appBar: AppBar(title: Text('home page')),
      body: ProductManager(
        products: products,
        deleteProduct: deleteProduct,
        addProduct: addProduct
      ),
    );
  }
}
