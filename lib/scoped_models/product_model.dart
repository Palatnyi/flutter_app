import './connected_model.dart';
import '../models/product.dart';

mixin ProductModel on ConnectedModel {
  final List<Product> _products = [];

  List<Product> get products {
    if (_displayFavourites == true) {
      return List.from(
          _products.where((Product product) => product.isFavourite).toList());
    }
    return List.from(_products);
  }

  void addProduct({title, description, address, price, imageUrl}) {

    Product product = Product(
      title: title,
      description: description,
      address: address,
      price: price,
      imageUrl: 'assets/food.jpg',
      id: authenticatedUser.id,
      email: authenticatedUser.email
    );

    _products.add(product);
    notifyListeners();
  }

  void deleteProduct(int index) {
    _products.removeAt(index);
    notifyListeners();
  }

  void updateProduct(int index, Product product) {
    _products[index] = product;
    notifyListeners();
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
        id: authenticatedUser.id,
        email: authenticatedUser.email
      );
    updateProduct(index, newProduct);
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
