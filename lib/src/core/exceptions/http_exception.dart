
import 'package:ansque/src/core/exceptions/app_exception.dart';

class HttpException extends AppException {
  /// If statusCode is 000 then it's a network problem

  final dynamic data;
  final String message;

  HttpException({
    int? statusCode,
    this.data,
    required this.message,
  }) : super(statusCode: statusCode);

  @override
  String get computedMessage {
    String? _message;
    if (statusCode == null || data == null) {
      _message = "Impossible de se connecter à l'Internet. Veuillez réessayer plus tard.";
    }
    if (data is Map) {
      if (data["message"] != null) {
        _message = data["message"];
      }
    }
    return _message ?? message;
  }
}
