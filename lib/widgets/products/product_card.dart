import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped_models/main_model.dart';
import './price_tag.dart';
import '../ui_widgets/title_default.dart';
import './address_tag.dart';
import '../../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  Widget _buildTitlePriceRow() {
    return Container(
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        TitleDefault(product.title),
        SizedBox(width: 10, height: 8.0),
        PriceTag('\$${product.price..toString()}')
      ]),
    );
  }

  Widget _buildButtonBar(BuildContext context) {
    return ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
      IconButton(
        icon: Icon(Icons.info),
        onPressed: () {
          Navigator.pushNamed<bool>(context, '/product/$productIndex');
        },
      ),
      ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
        return IconButton(
          color: Colors.red,
          icon: product.isFavourite
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
          onPressed: () {
            model.toggleFavourite(productIndex);
          },
        );
      })
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: <Widget>[
        Image.asset(product.imageUrl),
        _buildTitlePriceRow(),
        AddressTag(product.address),
        _buildButtonBar(context)
      ]),
    );
  }
}
