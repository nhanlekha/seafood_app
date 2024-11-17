import '../../data_source/seafood_api.dart';
import 'package:seafood_app/model/product_model.dart';
import 'package:seafood_app/domans/repo/base_repo.dart';
import 'package:seafood_app/domans/repo/product_repo.dart';
import 'package:seafood_app/domans/repo/impl/base_repo_impl.dart';

class ProductRepoImpl extends BaseRepoImpl implements ProductRepo {
  @override
  SeafoodApi seafoodApi;

  ProductRepoImpl({required this.seafoodApi}) : super(seafoodApi: seafoodApi);

  @override
  Future<List<ProductModel>> fetchNewProductData() {
    return fetchDataFormAPI(
        'android/get-new-product', (data) => ProductModel.fromJson(data));
  }

  @override
  Future<List<ProductModel>> fetchTrendingProductData() {
    return fetchDataFormAPI(
        'android/get-trending-product', (data) => ProductModel.fromJson(data));
  }

  @override
  Future<List<ProductModel>> fetchHotSaleProductData() {
    return fetchDataFormAPI(
        'android/get-order-product', (data) => ProductModel.fromJson(data));
  }

  @override
  Future<List<ProductModel>> fetchProductDataByCategoryId(int id) {
    return postDataToAPI('android/get-product-by-categoryId',
        {'category_id': id}, (data) => ProductModel.fromJson(data));
  }


}
