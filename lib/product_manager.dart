import 'package:flutter/material.dart';
import './products.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function deleteProduct;
  final Function addProduct;

  ProductManager({this.products, this.deleteProduct, this.addProduct});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
          child: Products(products: products))
    ]);
  }
}
