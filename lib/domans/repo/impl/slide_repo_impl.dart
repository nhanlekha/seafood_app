import 'package:dio/dio.dart';
import 'package:seafood_app/domans/data_source/seafood_api.dart';
import 'package:seafood_app/model/slider_model.dart';

import '../slide_repo.dart';

class SlideRepoImpl implements SlideRepo {
  SeafoodApi seafoodApi;

  SlideRepoImpl({required this.seafoodApi});

  Future<List<SliderModel>> fetchData() async {
    try{
      Response response = await seafoodApi.sendRequest.get("android/get-slider");
      List<dynamic> postMaps = response.data['data'];
      return postMaps.map((data) => SliderModel.fromJson(data)).toList();
    }catch(ex){
      throw ex;
    }
  }


}


