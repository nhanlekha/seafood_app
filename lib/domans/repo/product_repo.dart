import 'package:seafood_app/model/product_model.dart';

abstract class ProductRepo {
  Future<List<ProductModel>> fetchNewProductData();

  Future<List<ProductModel>> fetchTrendingProductData();

  Future<List<ProductModel>> fetchHotSaleProductData();

  Future<List<ProductModel>> fetchProductDataByCategoryId(int id);

}
