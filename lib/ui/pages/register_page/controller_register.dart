import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:srminhaeiro/models/api_response.model.dart';
import 'package:srminhaeiro/ui/pages/register_page/user.model.dart';

class RegisterController extends ChangeNotifier {
  String _name = "";
  String _email = "";
  String _password = "";
  String _repeatpassword = "";
  String _phoneNumber = "";

  String get name => _name;

  String get phone => _phoneNumber;

  String get password => _password;

  changeName(String value) {
    _name = value;
  }

  changeEmail(String value) {
    _email = value;
  }

  changePassword(String value) {
    _password = value;
  }

  changeRepeatPassword(String value) {
    _repeatpassword = value;
  }

  changePhoneNumber(String value) {
    _phoneNumber = value;
  }

  Future<ApiResponse<bool>> signUp() async {
    try {
      if (_password != _repeatpassword) {
        return ApiResponse.error(
            "As senhas são diferentes, precisam ser iguais.");
      }

      if (_name.isEmpty) {
        return ApiResponse.error("Nome não pode ser vazio.");
      }

      if (_name.split(' ').length == 1) {
        return ApiResponse.error("É necessário ao menos um sobrenome.");
      }

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
      if (userCredential.user != null) {
        var person = UserModel(
            fullName: _name, email: _email, phoneNumber: _phoneNumber);
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(userCredential.user!.uid)
            .set(person.toMap());
        await userCredential.user!.updateDisplayName(_name);
        await userCredential.user!.updateEmail(_email);
        return ApiResponse.sucess(true);
      } else {
        return ApiResponse.error("Eita! Deu alguma bronca");
      }
    } on FirebaseAuthException catch (e) {
      return ApiResponse.error(e.message);
    }
  }
}
