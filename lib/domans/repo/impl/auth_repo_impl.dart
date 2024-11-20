import 'package:dio/dio.dart';
import 'package:seafood_app/model/customer_model.dart';

import '../../data_source/seafood_api.dart';

class AuthRepoImpl {
  SeafoodApi seafoodApi;

  AuthRepoImpl({required this.seafoodApi});


  Future<CustomerModel?> fetchData(String customerEmail, String customerPassword) async {
    try {
      // Sử dụng phương thức POST thay vì GET
      final response = await seafoodApi.sendRequest.post(
        'android/check-login',
        data: {
          'customer_email': customerEmail,
          'customer_password': customerPassword,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      // Parse dữ liệu từ response
      final data = response.data['data'];
      if (response.data != null && response.data['data'] != null) {
        final data = response.data['data'];
        return CustomerModel.fromJson(data); // Chuyển đổi JSON thành đối tượng CustomerModel
      } else {
        // Trường hợp `data` null hoặc không tồn tại
        print('Dữ liệu trả về null hoặc không hợp lệ');
        return null;
      }


      return CustomerModel.fromJson(data); // Chuyển đổi JSON thành đối tượng CustomerModel
    } catch (error) {
      throw Exception('Lỗi khi gửi yêu cầu: $error');
    }
  }



}