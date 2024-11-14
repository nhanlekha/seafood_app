import 'package:dio/dio.dart';
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
      /*
      * {
  "data": [
    {
      "matp": 1,
      "name_city": "Thành phố Hà Nội",
      "type": "Thành phố Trung ương"
    },
    {
      "matp": 2,
      "name_city": "Tỉnh Hà Giang",
      "type": "Tỉnh"
    },
    {
      "matp": 4,
      "name_city": "Tỉnh Cao Bằng",
      "type": "Tỉnh"
    },
    {
      "matp": 6,
      "name_city": "Tỉnh Bắc Kạn",
      "type": "Tỉnh"
    },
    {
      "matp": 8,
      "name_city": "Tỉnh Tuyên Quang",
      "type": "Tỉnh"
    },
    {
      "matp": 10,
      "name_city": "Tỉnh Lào Cai",
      "type": "Tỉnh"
    },
    {
      "matp": 11,
      "name_city": "Tỉnh Điện Biên",
      "type": "Tỉnh"
    },
    {
      "matp": 12,
      "name_city": "Tỉnh Lai Châu",
      "type": "Tỉnh"
    },
    {
      "matp": 14,
      "name_city": "Tỉnh Sơn La",
      "type": "Tỉnh"
    },
    {
      "matp": 15,
      "name_city": "Tỉnh Yên Bái",
      "type": "Tỉnh"
    },
    {
      "matp": 17,
      "name_city": "Tỉnh Hoà Bình",
      "type": "Tỉnh"
    },
    {
      "matp": 19,
      "name_city": "Tỉnh Thái Nguyên",
      "type": "Tỉnh"
    },
    {
      "matp": 20,
      "name_city": "Tỉnh Lạng Sơn",
      "type": "Tỉnh"
    },
    {
      "matp": 22,
      "name_city": "Tỉnh Quảng Ninh",
      "type": "Tỉnh"
    },
    {
      "matp": 24,
      "name_city": "Tỉnh Bắc Giang",
      "type": "Tỉnh"
    },
    {
      "matp": 25,
      "name_city": "Tỉnh Phú Thọ",
      "type": "Tỉnh"
    },
    {
      "matp": 26,
      "name_city": "Tỉnh Vĩnh Phúc",
      "type": "Tỉnh"
    },
    {
      "matp": 27,
      "name_city": "Tỉnh Bắc Ninh",
      "type": "Tỉnh"
    },
    {
      "matp": 30,
      "name_city": "Tỉnh Hải Dương",
      "type": "Tỉnh"
    },
    {
      "matp": 31,
      "name_city": "Thành phố Hải Phòng",
      "type": "Thành phố Trung ương"
    },
    {
      "matp": 33,
      "name_city": "Tỉnh Hưng Yên",
      "type": "Tỉnh"
    },
    {
      "matp": 34,
      "name_city": "Tỉnh Thái Bình",
      "type": "Tỉnh"
    },
    {
      "matp": 35,
      "name_city": "Tỉnh Hà Nam",
      "type": "Tỉnh"
    },
    {
      "matp": 36,
      "name_city": "Tỉnh Nam Định",
      "type": "Tỉnh"
    },
    {
      "matp": 37,
      "name_city": "Tỉnh Ninh Bình",
      "type": "Tỉnh"
    },
    {
      "matp": 38,
      "name_city": "Tỉnh Thanh Hóa",
      "type": "Tỉnh"
    },
    {
      "matp": 40,
      "name_city": "Tỉnh Nghệ An",
      "type": "Tỉnh"
    },
    {
      "matp": 42,
      "name_city": "Tỉnh Hà Tĩnh",
      "type": "Tỉnh"
    },
    {
      "matp": 44,
      "name_city": "Tỉnh Quảng Bình",
      "type": "Tỉnh"
    },
    {
      "matp": 45,
      "name_city": "Tỉnh Quảng Trị",
      "type": "Tỉnh"
    },
    {
      "matp": 46,
      "name_city": "Tỉnh Thừa Thiên Huế",
      "type": "Tỉnh"
    },"type": "Tỉnh"
    {
      "matp": 96,
      "name_city": "Tỉnh Cà Mau",
      "type": "Tỉnh"
    }
  ],
  "status_code": 200,
  "message": "ok"
}
      *
      * */

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
