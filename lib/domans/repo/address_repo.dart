import 'package:seafood_app/model/province_model.dart';
import 'package:seafood_app/model/wards_model.dart';

import '../../model/city_model.dart';

abstract class AddressRepo {
  Future<List<CityModel>> fetchListCity();

  Future<List<ProvinceModel>> fetchListProvincesByCity(CityModel city);

  Future<List<WardModel>> fetchListWardByProvince(ProvinceModel province);
}
