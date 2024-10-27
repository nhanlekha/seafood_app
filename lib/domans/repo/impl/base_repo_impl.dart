import 'package:dio/dio.dart';
import 'package:seafood_app/domans/repo/base_repo.dart';

import '../../data_source/seafood_api.dart';

class BaseRepoImpl implements BaseRepo {
  SeafoodApi seafoodApi;

  BaseRepoImpl({required this.seafoodApi});

  @override
  Future<List<T>> fetchDataFormAPI<T>(
      String endpoint,
      T Function(Map<String, dynamic>) fromJson,
      ) async {
    try {
      Response response = await seafoodApi.sendRequest.get(endpoint);
      List<dynamic> dataMaps = response.data['data'];
      return dataMaps.map((data) => fromJson(data)).toList();
    } catch (ex) {
      print(ex.toString());
      throw ex;
    }
  }

}