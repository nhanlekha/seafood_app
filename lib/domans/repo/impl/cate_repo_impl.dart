import 'package:seafood_app/domans/repo/cate_repo.dart';
import 'package:seafood_app/domans/repo/impl/base_repo_impl.dart';
import 'package:seafood_app/model/category_model.dart';

import '../../data_source/seafood_api.dart';

class CateRepoImpl  extends BaseRepoImpl implements CateRepo{
  SeafoodApi seafoodApi;

  CateRepoImpl({required this.seafoodApi}) : super(seafoodApi: seafoodApi);

  @override
  Future<List<CategoryModel>> fetchData() {
    return fetchDataFormAPI('android/get-category', (data) => CategoryModel.fromJson(data));
  }
}