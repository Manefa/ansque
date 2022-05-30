import 'package:ansque/src/core/exceptions/functional_error.dart';
import 'package:ansque/src/datasource/models/requests/login_request.dart';
import 'package:flutter/foundation.dart';

abstract class LoginState {
  final LoginRequest request;

  LoginState({required this.request});
}

class LoginIdle extends LoginState {
  LoginIdle({LoginRequest? request}) : super(request: request ?? LoginRequest(email: kDebugMode ? 'backers99@gmail.com' :'', password: kDebugMode ? '12345678' : ''));

  LoginIdle copyWith({LoginRequest? request}) {
    return LoginIdle(request: request ?? LoginRequest(email: kDebugMode ? 'backers99@gmail.com' :'', password: kDebugMode ? '12345678' : ''));
  }
}

class LoginSuccess extends LoginState {
  LoginSuccess({required LoginRequest request}) : super(request: request);
}

class LoginLoading extends LoginState {
  LoginLoading({required LoginRequest request}) : super(request: request);
}

class LoginError extends LoginState {
  final FunctionalError error;

  LoginError({
    required LoginRequest request,
    required this.error,
  }) : super(request: request);
}
