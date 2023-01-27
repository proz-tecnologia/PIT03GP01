import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:srminhaeiro/repositories/auth_repository.dart';

class UserStore extends ChangeNotifier {
  AuthRepository repository = AuthRepository();
  User? userModel;

  loadUser() {
    userModel = repository.loadUser();
    notifyListeners();
  }

  logout() async {
    userModel = await repository.logout();
    notifyListeners();
  }
}
