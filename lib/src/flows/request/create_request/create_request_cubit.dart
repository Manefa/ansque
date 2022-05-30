import 'dart:io';

import 'package:ansque/src/core/exceptions/functional_error.dart';
import 'package:ansque/src/datasource/models/data/entities/request_entity.dart';
import 'package:ansque/src/datasource/repositories/request_repository.dart';
import 'package:ansque/src/flows/request/create_request/create_request_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateRequestCubit extends Cubit<CreateRequestState>{
  final RequestRepository requestRepository;
  CreateRequestCubit({required this.requestRepository}) : super(CreateRequestInitial());

  void onSubjectChange(String subject){
    emit(CreateRequestInitial(requestEntity: state.requestEntity.copyWith(subject: subject)));
  }

  void onEmailChange(String email){
    if (state is CreateRequestInitial) {
      final _state = (state as CreateRequestInitial);
      emit(_state.copyWith(request: _state.request.copyWith(email: email)));
    }
  }

  void createRequest({required RequestEntity requestEntity}){
    emit(CreateRequestLoading(requestEntity: state.requestEntity));

    requestRepository.createRequest(requestEntity).then((value) {
      emit(CreateRequestSuccess(requestEntity: state.requestEntity));
    }).catchError((e){
      emit(CreateRequestFail(requestEntity: state.requestEntity ,error: e));
    });
  }

  Future<List<File>> getFiles() async {
    List<File> files = [];
    try{
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: true,
      );

      for(int i = 0; i < result!.files.length; i++){
        files.add(File(result.files[i].path!));
      }
      return files;
    }catch(e){
     throw FunctionalError(message: e.toString());
    }
  }

}