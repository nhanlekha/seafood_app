import 'package:seafood_app/domans/data_source/seafood_api.dart';
import 'package:seafood_app/model/city_model.dart';
import 'package:seafood_app/model/province_model.dart';
import 'package:seafood_app/model/wards_model.dart';
import '../address_repo.dart';

class AddressRepoImpl extends AddressRepo {
  SeafoodApi seafoodApi;

  AddressRepoImpl({required this.seafoodApi});

  @override
  Future<List<CityModel>> fetchListCity() async {
    try {
      final response = await seafoodApi.sendRequest.get('android/get-city');
      Map<String, dynamic> data = response.data;
      List<dynamic> cities = data['data'];
      return cities.map((json) => CityModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load cities: $e');
    }
  }

  @override
  Future<List<ProvinceModel>> fetchListProvincesByCity(CityModel city) async {
    try {
      final response = await seafoodApi.sendRequest.get(
        'android/get-province',
        queryParameters: {'name_city': city.nameCity},
      );
      Map<String, dynamic> data = response.data;
      List<dynamic> provinces = data['data'];
      return provinces.map((json) => ProvinceModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load provinces: $e');
    }
  }

  @override
  Future<List<WardModel>> fetchListWardByProvince(
      ProvinceModel province) async {
    try {
      final response = await seafoodApi.sendRequest.get(
        'android/get-wards',
        queryParameters: {'name_province': province.nameProvince},
      );
      Map<String, dynamic> data = response.data;
      List<dynamic> wards = data['data'];
      return wards.map((json) => WardModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load wards: $e');
    }
  }
}
