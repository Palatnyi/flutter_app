import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './product_edit.dart';
import './products_list.dart';
import '../scoped_models/main_model.dart';

class ProductsManagement extends StatelessWidget {
  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        AppBar(
          automaticallyImplyLeading: false,
          title: Text('Choose'),
        ),
        ListTile(
          trailing: Icon(Icons.shop),
          title: Text('all products'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/products');
          },
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return DefaultTabController(
          length: 2,
          child: Scaffold(
              drawer: _buildSideDrawer(context),
              appBar: AppBar(
                title: Text('Products Management'),
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.create)),
                    Tab(icon: Icon(Icons.list))
                  ],
                ),
              ),
              body: TabBarView(children: <Widget>[
                ProductsEditPage(addProduct: model.addProduct),
                ProductsListPage(
                    model.products, model.updateProduct, model.deleteProduct)
              ])));
    });
  }
}
