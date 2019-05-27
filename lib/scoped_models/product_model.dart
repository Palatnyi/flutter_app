import './connected_model.dart';
import '../models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

mixin ProductModel on ConnectedModel {
  List<Product> _products = [];

  List<Product> get products {
    if (_displayFavourites == true) {
      return List.from(
          _products.where((Product product) => product.isFavourite).toList());
    }
    return List.from(_products);
  }

  void fetchProducts() {
    http
        .get('https://flutter-project-d3ff6.firebaseio.com/products.json')
        .then((http.Response response) {
      List<Product> productList = [];
      final Map<String, dynamic> productsData = json.decode(response.body);
      productsData.forEach((id, product) {
        Product _product = Product(
            title: product['title'],
            description: product['description'],
            address: product['address'],
            price: product['price'],
            imageUrl: product['imageUrl'],
            userId: authenticatedUser.id,
            email: authenticatedUser.email,
            id: id);
        productList.add(_product);
      });
      _products = productList;
      notifyListeners();
    });
  }

  void addProduct({title, description, address, price, imageUrl}) {
    Map<String, dynamic> _product = {
      'title': title,
      'description': description,
      'address': address,
      'price': price,
      'imageUrl': imageUrl
    };

    http
        .post('https://flutter-project-d3ff6.firebaseio.com/products.json',
            body: json.encode(_product))
        .then((http.Response response) {
      fetchProducts();
    });
  }

  void deleteProduct(int index) {
    _products.removeAt(index);
    notifyListeners();
  }

  void updateProduct(title, description, address, price, imageUrl, id) {
    Map<String, dynamic> _product = {
      'title': title,
      'description': description,
      'address': address,
      'price': price,
      'imageUrl': imageUrl
    };

    http
        .put('https://flutter-project-d3ff6.firebaseio.com/products/${id}.json')
        .then((http.Response response) {
      fetchProducts();
    });
  }

  void toggleFavourite(int index) {
    Product product = _products[index];
    Product newProduct = Product(
        title: product.title,
        description: product.description,
        address: product.address,
        price: product.price,
        imageUrl: product.imageUrl,
        isFavourite: !product.isFavourite,
        userId: authenticatedUser.id,
        email: authenticatedUser.email);
    // updateProduct(index, newProduct);
    notifyListeners();
  }

  bool _displayFavourites = false;

  bool get displayFavourites {
    return _displayFavourites;
  }

  void toggleDisplayMode() {
    _displayFavourites = !_displayFavourites;
    notifyListeners();
  }
}
