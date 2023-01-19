import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_with_docs_and_my_value/model/user.dart';

mixin ConvertUser {
  AppUser convertUserFromCredantianl(UserCredential user) {
    return AppUser(user.user!.uid, user.user!.email!);
  }

  AppUser? convertUserFromUser(User? user) {
    return AppUser(user!.uid, user.email!);
  }
}
