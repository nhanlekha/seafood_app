import 'package:dio/dio.dart';

FormData convertObjectToFormData(dynamic object) {
  if (object is Map<String, dynamic>) {
    return FormData.fromMap(object);
  } else if (object is List<dynamic>) {
    final Map<String, dynamic> mappedList = {};
    for (int i = 0; i < object.length; i++) {
      mappedList['item[$i]'] = object[i];
    }
    return FormData.fromMap(mappedList);
  } else if (object is dynamic) {
    return FormData.fromMap(object.toMap());
  }
  throw Exception("Unsupported object type for FormData conversion");
}