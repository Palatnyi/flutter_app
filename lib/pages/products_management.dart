import 'package:flutter/material.dart';
import './products.dart';
import './product_create.dart';
import './products_list.dart';

class ProductsManagement extends StatelessWidget {
  final Function addProduct;
  final Function deleteProduct;

  ProductsManagement(this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: Drawer(
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
            ),
            appBar: AppBar(
              title: Text('Products Management'),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.create)),
                  Tab(icon: Icon(Icons.list))
                ],
              ),
            ),
            body: TabBarView(
                children: <Widget>[ProductsCreatePage(addProduct, deleteProduct), ProductsListPage()])));
  }
}
