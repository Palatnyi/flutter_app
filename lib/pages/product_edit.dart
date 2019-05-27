import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductsEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Product product;
  ProductsEditPage({this.addProduct, this.product, this.updateProduct});

  @override
  State<ProductsEditPage> createState() {
    return _ProductsEditPageState();
  }
}

class _ProductsEditPageState extends State<ProductsEditPage> {
  String title = '';
  String description = '';
  double price;
  String address;
  final _formKey = GlobalKey<FormState>();

  Widget _buildTitleWidget() {
    return TextFormField(
      initialValue: widget.product == null ? '' : widget.product.title,
      decoration: InputDecoration(labelText: 'Title'),
      validator: (String value) {
        if (value.isEmpty || value.length < 5) {
          return 'Please add "title" value. It m ust be 5+ characters';
        }
      },
      onSaved: (String value) {
        title = value;
      },
    );
  }

  Widget _buildDescriptionWidget() {
    return TextFormField(
        initialValue: widget.product == null ? '' : widget.product.description,
        decoration: InputDecoration(labelText: 'Description'),
        maxLines: 4,
        onSaved: (String value) {
          description = value;
        },
        validator: (String value) {
          if (value.isEmpty || value.length < 5) {
            return 'Please add "description" value. It m ust be 5+ characters';
          }
        });
  }

  Widget _buildPriceWidget() {
    return TextFormField(
        initialValue: widget.product == null ? '' : widget.product.price.toString(),
        decoration: InputDecoration(labelText: 'Price'),
        keyboardType: TextInputType.number,
        onSaved: (String value) {
          price = double.parse(value.replaceFirst(RegExp(r','), '.'));
        },
        validator: (String value) {
          if (!RegExp(r'^(?:[1-9]\d*|0)?(?:[.,]\d+)?$').hasMatch(value)) {
            return 'Price must be Number';
          }
        });
  }

  Widget _buildAddressWidget() {
    return TextFormField(
      initialValue: widget.product == null ? '' : widget.product.address,
      decoration: InputDecoration(labelText: 'Address'),
      onSaved: (String value) {
        address = value;
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Product product = Product(
        title: title,
        description: description,
        address: address,
        price: price,
        imageUrl: 'assets/food.jpg',
        id: widget.product.id
      );
      if (widget.product == null) {
        widget.addProduct(
          title: title,
          description: description,
          address: address,
          price: price,
          imageUrl: 'assets/food.jpg',
        );
        Navigator.pushReplacementNamed(context, '/products');
      } else {
        widget.updateProduct(
          title: title,
          description: description,
          address: address,
          price: price,
          imageUrl: 'assets/food.jpg',
          id: widget.product.id
        );
      }
    }
  }

  Widget _getContent(context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(10.0),
          child: ListView(children: <Widget>[
            _buildTitleWidget(),
            _buildDescriptionWidget(),
            _buildPriceWidget(),
            _buildAddressWidget(),
            RaisedButton(
              child: Text('Save'),
              onPressed: _submitForm,
            )
          ]),
        ),
      ),
    );
  }

  Widget _getContentWithScaffold(context) {
    return Scaffold(
        appBar: AppBar(title: Text('Edit product')),
        body: _getContent(context));
  }

  @override
  Widget build(BuildContext context) {
    return widget.product == null
        ? _getContent(context)
        : _getContentWithScaffold(context);
  }
}
