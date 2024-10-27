import 'package:seafood_app/model/category_model.dart';

abstract class CateRepo {
  Future<List<CategoryModel>> fetchData();
}