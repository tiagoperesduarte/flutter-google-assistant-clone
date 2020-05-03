class ServiceUnavailableException implements Exception {
  final message;

  ServiceUnavailableException([this.message]);

  @override
  String toString() {
    return "ServiceUnavailableException: $message";
  }
}
