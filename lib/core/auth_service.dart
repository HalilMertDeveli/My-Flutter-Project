import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_with_docs_and_my_value/core/i_auth_service.dart';
import 'package:flutter_app_with_docs_and_my_value/mixin/convert_user_mixin.dart';
import 'package:flutter_app_with_docs_and_my_value/model/user.dart';

class AuthService with ConvertUser implements IAuthService {
  final authInstance = FirebaseAuth.instance;

  @override
  Stream<AppUser?> get authStateChange =>
      authInstance.authStateChanges().map(convertUserFromUser);

  @override
  Future<AppUser?> createUserEmailAndPassword(
      {required String email, required String password}) async {
    var tempUser = await authInstance.createUserWithEmailAndPassword(
        email: email, password: password);
    return convertUserFromCredantianl(tempUser);
  }

  @override
  Future<void> logOut() async {
    await authInstance.signOut();
  }

  @override
  Future<AppUser?> signInEmailAndPassword(
      {required String email, required String password}) async {
    var tempUser = await authInstance.signInWithEmailAndPassword(
        email: email, password: password);
    return convertUserFromCredantianl(tempUser);
  }
}
