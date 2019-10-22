class RsonException implements Exception {
  String message;

  RsonException(this.message);

  @override
  String toString() {
    return "[Rson Exception]: $message";
  }
}
