import 'package:ansque/src/datasource/models/data/entities/user_entity.dart';
import 'package:ansque/src/shared/state/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit() : super(AppState());

  void saveUserData(String email){
    emit(AppState(user: UserEntity(email: email)));
  }
}