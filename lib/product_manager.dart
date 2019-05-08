import 'package:flutter/material.dart';
import './product_control.dart';
import './products.dart';

class ProductManager extends StatefulWidget {
  Map<String, String> startingProduct;
  ProductManager({this.startingProduct}) {
    print('[ProductManager Widget] Constructor');
  }

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  final List<Map<String, String>> _products = [];

  @override
  void initState() {
    if(widget.startingProduct != null) {
    _products.add(widget.startingProduct);
    }
    super.initState();
  }

  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    print('product index $index');
    setState(() {
      _products.removeAt(index);
    });
    print(_products);
  }

  @override
  Widget build(BuildContext context) {
    print(_products);
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10.0),
        child: ProductControl(addProduct: _addProduct)
      ),
      Expanded(child: Products(products: _products, deleteProduct: _deleteProduct))
    ]);
  }
}
