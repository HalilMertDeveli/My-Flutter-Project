import 'package:flutter_app_with_docs_and_my_value/old_firebase_folders/model/user.dart';

abstract class IAuthService {
  Future<AppUser?> createUserEmailAndPassword(
      {required String email, required String password});
  Future<AppUser?> signInEmailAndPassword(
      {required String email, required String password});
  Future<void> logOut();
  Stream<AppUser?> get authStateChange;
}
