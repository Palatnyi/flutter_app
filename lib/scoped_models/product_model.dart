import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';

class ProductModel extends Model {
  final List<Product> _products = [];

  List<Product> get products {
    return List.from(_products);
  }

  void addProduct(Product product) {
    _products.add(product);
  }

  void deleteProduct(int index) {
    print('delete product $index');
    _products.removeAt(index);
    print('after removal $_products');
    
  }

  void updateProduct(int index, Product product) {
    _products[index] = product;
  }
}
