import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class SeafoodApi {
  final Dio _dio = Dio();



  SeafoodApi(){
    _dio.options.baseUrl = "http://192.168.1.14/DoAnCNWeb/api/";
    _dio.interceptors.add(PrettyDioLogger(

    ));
  }

  Dio get sendRequest => _dio;
}