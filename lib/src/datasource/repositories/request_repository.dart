import 'package:ansque/src/core/exceptions/functional_error.dart';
import 'package:ansque/src/datasource/models/collections/request_collection.dart';
import 'package:ansque/src/datasource/models/data/entities/request_entity.dart';
import 'package:ansque/src/datasource/models/data/models/request_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RequestRepository{

  CollectionReference requestCollection = FirebaseFirestore.instance.collection(RequestCollection.name);

  RequestRepository();

  Future<void> createRequest(RequestEntity requestEntity)  async {
    try{
      requestCollection.add(requestEntity);
    }on FirebaseException catch (e) {
      throw FunctionalError(message: e.code+" "+e.message!);
    }
  }

  Stream<List<RequestModel>>? getAllRequests()  {
    try{
      return requestCollection.snapshots().map((snapshot) => snapshot.docs.map((e) => RequestModel.fromEntity(RequestEntity.fromSnapshot(e))).toList());
    }on FirebaseException catch (e) {
      FunctionalError(message: e.code+" "+e.message!);
    }
    return null;
  }

}