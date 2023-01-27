import 'package:firebase_auth/firebase_auth.dart';
import 'package:srminhaeiro/ui/pages/login_page/controller/login.controller.dart';

class LoginRepository {
  Future<bool> signIn({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'user-not-found') {
        throw ExceptionUsers(
            "Usuário incorreto ou não consta no banco de dados!");
      } else if (exception.code == 'wrong-password') {
        throw ExceptionUsers("Senha incorreta, tente novamente.");
      } else {
        throw ExceptionUsers("Algo deu errado!");
      }
    }
  }
}
