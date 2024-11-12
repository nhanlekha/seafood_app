abstract class BaseRepo {
  Future<List<T>> fetchDataFormAPI<T>(
    String endpoint,
    T Function(Map<String, dynamic>) fromJson,
  );
  Future<List<T>> postDataToAPI<T>(
    String endpoint,
    Map<String, dynamic> body,
    T Function(Map<String, dynamic>) fromJson,
  );
}
