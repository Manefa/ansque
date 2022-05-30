import 'package:ansque/src/core/exceptions/app_exception.dart';

class FunctionalError extends AppException{
  final String message;

  FunctionalError({required this.message});
}
