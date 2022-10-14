class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}
class NoInternetException implements Exception {}
