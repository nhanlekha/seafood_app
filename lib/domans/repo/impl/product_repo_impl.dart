import 'package:seafood_app/domans/repo/base_repo.dart';
import 'package:seafood_app/domans/repo/impl/base_repo_impl.dart';
import 'package:seafood_app/domans/repo/product_repo.dart';
import 'package:seafood_app/model/product_model.dart';

import '../../data_source/seafood_api.dart';

class ProductRepoImpl extends BaseRepoImpl implements ProductRepo{
  SeafoodApi seafoodApi;

  ProductRepoImpl({required this.seafoodApi}) : super(seafoodApi: seafoodApi);

  @override
  Future<List<ProductModel>> fetchNewProductData() {
    return fetchDataFormAPI('android/get-new-product', (data) => ProductModel.fromJson(data));
  }

  @override
  Future<List<ProductModel>> fetchTrendingProductData() {
    return fetchDataFormAPI('android/get-trending-product', (data) => ProductModel.fromJson(data));
  }


}