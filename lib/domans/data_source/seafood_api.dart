import 'package:dio/dio.dart';

class SeafoodApi {
  final Dio _dio = Dio();

  SeafoodApi({String baseUrl = "http://192.168.1.14/DoAnCNWeb/api/"}) {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10), // Thời gian chờ kết nối
      receiveTimeout: const Duration(seconds: 10), // Thời gian chờ nhận dữ liệu
      sendTimeout: const Duration(seconds: 10), // Thời gian chờ gửi dữ liệu
    );

    // _dio.interceptors.add(
    //   PrettyDioLogger(
    //     requestHeader: true,
    //     requestBody: true,
    //     responseHeader: true,
    //     responseBody: true,
    //     error: true,
    //     compact: false,
    //   ),
    // );
  }

  Dio get sendRequest => _dio;
}
