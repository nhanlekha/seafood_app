abstract class BaseRepo {
  Future<List<T>> fetchDataFormAPI<T>(
      String endpoint,
      T Function(Map<String, dynamic>) fromJson,
      );
}