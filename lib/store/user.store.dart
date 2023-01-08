import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserStore extends ChangeNotifier {
  User? userModel;

  loadUser() {
    userModel = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
    loadUser;
  }
}
