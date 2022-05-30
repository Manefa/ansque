import 'package:ansque/src/core/exceptions/http_exception.dart';

class AppException with Exception {
  final Exception? exception;
  final int? statusCode;

  AppException({
    this.exception,
    this.statusCode,
  });

  String get computedMessage {
    if (exception is HttpException) {
      return (exception as HttpException).computedMessage;
    }

    return "Une erreur inconnue nous empêche de traiter votre requête.";
  }
}
