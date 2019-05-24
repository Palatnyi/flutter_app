import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../scoped_models/main_model.dart';
import 'package:scoped_model/scoped_model.dart';
import './product_edit.dart';
import '../models/product.dart';

class ProductsListPage extends StatelessWidget {
  final Function updateProduct;
  final Function deleteProduct;
  final List<Product> products;

  ProductsListPage(this.products, this.updateProduct, this.deleteProduct);

  Widget _iconButton(BuildContext context, int index, model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Product product = model.products[index];
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return ProductsEditPage(
              product: product,
              updateProduct: (updatedProduct) {
                updateProduct(index, updatedProduct);
              });
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return ListView.builder(
        itemCount: model.products.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(model.products[index].title),
            onDismissed: (DismissDirection direction) {
              if (direction == DismissDirection.endToStart) {
                print(deleteProduct);
                model.deleteProduct(index);
              }
            },
            background: Container(color: Colors.red),
            child: Column(
              children: <Widget>[
                Container(
                  child: ListTile(
                      leading: CircleAvatar(
                          backgroundImage:
                              AssetImage(model.products[index].imageUrl)),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(model.products[index].title),
                          SizedBox(height: 4.0),
                          Text('\$${model.products[index].price.toString()}',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10.0))
                        ],
                      ),
                      trailing: _iconButton(context, index, model)),
                ),
                Divider()
              ],
            ),
          );
        },
      );
    });
  }
}
