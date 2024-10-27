import 'package:seafood_app/model/product_model.dart';

abstract class ProductRepo {
  Future<List<ProductModel>> fetchNewProductData();

  Future<List<ProductModel>>fetchTrendingProductData();
}