import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products({this.products = const []});

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(children: <Widget>[
        Image.asset(products[index]['image']),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(
            child: Text(products[index]['title'],
            style: TextStyle(fontFamily: 'Oswald', fontSize: 26))
          ),
          SizedBox(width: 10, height: 8.0),
          // Text(products[index]['description']),
          Container(
              padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text('\$${products[index]['price'].toString()}', style: TextStyle(color: Colors.white))),
        ]),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
          child: Text('Union Square, San Francisco'),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(4.0),
          )
        ),
        ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.pushNamed<bool>(context, '/product/$index');
            },
          ),
          IconButton(
            color: Colors.red,
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          )
        ])
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget productCard =
        Center(child: Text('No products found, please add some'));

    if (products.length > 0) {
      productCard = ListView.builder(
          itemBuilder: _buildProductItem, itemCount: products.length);
    }
    return productCard;
  }
}
