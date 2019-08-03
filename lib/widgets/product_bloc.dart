import 'dart:async';

import 'package:flutteruiapp/widgets/product_view_model.dart';
import 'package:flutteruiapp/widgets/product.dart';

class ProductBloc {
  final ProductViewModel productViewModel = ProductViewModel();
  final productController = StreamController<List<Product>>();
  Stream<List<Product>> get productItems => productController.stream;

  ProductBloc() {
    productController.add(productViewModel.getProducts());
  }
}
