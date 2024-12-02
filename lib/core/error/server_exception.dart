class ServerException implements Exception {
  ServerException({required this.error});

  final String error;

  @override
  String toString() {
    print("ServerException => $error");
    return "Error: $error";
  }
}

class CacheException implements Exception {
  CacheException({required this.error});

  final String error;

  @override
  String toString() {
    return "CacheException: $error";
  }
}
