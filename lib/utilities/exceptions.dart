class HTTPException implements Exception {
  String message;
  HTTPException({required this.message});
  @override
  String toString() {
    return message;
  }
}
