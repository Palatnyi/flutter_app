import 'package:flutter/material.dart';
import '../widgets/ui_widgets/title_default.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String address;
  final String description;
  final double price;

  ProductPage(
      this.title, this.imageUrl, this.description, this.address, this.price);

  Widget _buildAddressPriceRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text(address,
          style: TextStyle(
              fontSize: 14.0, fontFamily: 'Oswald', color: Colors.grey)),
      Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text('|',
              style: TextStyle(
                  fontSize: 14.0, fontFamily: 'Oswald', color: Colors.grey))),
      Text('\$${price.toString()}',
          style: TextStyle(
              fontSize: 14.0, fontFamily: 'Oswald', color: Colors.grey)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
            appBar: AppBar(title: Text(title)),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(imageUrl),
                        Center(
                          child: TitleDefault(title),
                        ),
                        _buildAddressPriceRow(),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(address),
                        ),
                      ]),
                ),
              ],
            )));
  }
}
