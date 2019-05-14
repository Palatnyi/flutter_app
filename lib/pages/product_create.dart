import 'package:flutter/material.dart';

class ProductsCreatePage extends StatefulWidget {
  final Function addProduct;
  final Function deleteProduct;
  ProductsCreatePage(this.addProduct, this.deleteProduct);

  @override
  State<ProductsCreatePage> createState() {
    return _ProductsCreatePageState();
  }
}

class _ProductsCreatePageState extends State<ProductsCreatePage> {
  String title = '';
  String description = '';
  double price;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'product title'),
          onChanged: (String value) {
            setState(() {
              title = value;
            });
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'product description'),
          maxLines: 4,
          onChanged: (String value) {
            setState(() {
              description = value;
            });
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'product price 1'),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              price = double.parse(value);
            });
          },
        ),
        RaisedButton(
          child: Text('Save'),
          onPressed: () {
            Map<String, dynamic> product = {
              'title': title,
              'description': description,
              'price': price,
              'image': 'assets/food.jpg'
            };
            widget.addProduct(product);
            Navigator.pushReplacementNamed(context, '/products');
          },
        )
      ]),
    );
  }
}
