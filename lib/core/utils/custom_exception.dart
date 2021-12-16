class CustomException implements Exception {
  final int? code;
  final String message;

  const CustomException({this.code, this.message = ''});
  @override
  String toString() {
    return '{errorCode:$code, message:$message}';
  }
}
