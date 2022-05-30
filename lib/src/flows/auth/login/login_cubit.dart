import 'package:ansque/src/datasource/repositories/auth_repository.dart';
import 'package:ansque/src/flows/auth/login/login_state.dart';
import 'package:ansque/src/shared/logic/app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState>{
  final AuthRepository authRepository;
  final AppCubit appCubit;
  LoginCubit({
    required this.authRepository,
    required this.appCubit
  }) : super(LoginIdle());

  void onEmailChange(String email){
    if (state is LoginIdle) {
      final _state = (state as LoginIdle);
      emit(_state.copyWith(request: _state.request.copyWith(email: email)));
    }
  }

  void onPasswordChange(String password){
    if (state is LoginIdle) {
      final _state = (state as LoginIdle);
      emit(_state.copyWith(request: _state.request.copyWith(password: password)));
    }
  }

  void login(){
    emit(LoginLoading(request: state.request));
    authRepository.login(request: state.request).then((value) {
      appCubit.saveUserData(value.user!.email!);
      emit(LoginSuccess(request: state.request));
    }).catchError((e){
      emit(LoginError(request: state.request, error: e));
    });
  }
}