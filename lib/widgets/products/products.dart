import 'package:flutter/material.dart';
import './product_card.dart';
import '../../models/product.dart';

class Products extends StatelessWidget {
  final List<Product> products;
  final Function fetchProducts;

  Products({this.products, this.fetchProducts});

  @override
  Widget build(BuildContext context) {
    Widget productCard = Center(child: Text('No products found, please add some'));

    if (products.length > 0) {
      productCard = RefreshIndicator(
        child: ListView.builder(
          itemBuilder: (BuildContext context, index) =>
              ProductCard(products[index], index),
          itemCount: products.length
        ),
        onRefresh: () {
          return fetchProducts();
        },
      );
    }
    return productCard;
  }
}
