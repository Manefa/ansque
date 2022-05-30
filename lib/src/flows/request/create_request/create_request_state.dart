import 'package:ansque/src/core/exceptions/functional_error.dart';
import 'package:ansque/src/datasource/models/data/entities/request_entity.dart';

abstract class CreateRequestState{
  final RequestEntity requestEntity;

  CreateRequestState({required this.requestEntity});
}

class CreateRequestInitial extends CreateRequestState{
  CreateRequestInitial({RequestEntity? requestEntity}) : super(requestEntity: requestEntity!);
}

class CreateRequestLoading extends CreateRequestState{
  CreateRequestLoading({required RequestEntity requestEntity}) : super(requestEntity: requestEntity);
}

class CreateRequestSuccess extends CreateRequestState{
  CreateRequestSuccess({required RequestEntity requestEntity}) : super(requestEntity: requestEntity);
}

class CreateRequestFail extends CreateRequestState{
  final FunctionalError error;

  CreateRequestFail({required this.error, required RequestEntity requestEntity}) : super(requestEntity: requestEntity);
}