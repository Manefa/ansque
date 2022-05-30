import 'package:ansque/src/core/exceptions/functional_error.dart';
import 'package:ansque/src/datasource/models/requests/login_request.dart';
import 'package:firebase_auth/firebase_auth.dart'  as auth;

class AuthRepository{
  auth.FirebaseAuth authInstance;

  AuthRepository({
    required this.authInstance,
  });

  Future<auth.UserCredential> login({required LoginRequest request}) async {
    try {
      auth.UserCredential userCredential = await authInstance.signInWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      return userCredential;
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw FunctionalError(message: "Nom d'utilisateur ou code pin incorrect.");
      }
      throw FunctionalError(message: "Impossible de vous connecter. Veuillez réessayer plutard.");
    }
  }
}