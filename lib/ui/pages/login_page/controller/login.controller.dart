import 'package:firebase_auth/firebase_auth.dart';
import 'package:srminhaeiro/store/user.store.dart';
import 'package:srminhaeiro/ui/components/progress_dialog.component.dart';

class LoginController {
  final UserStore _userStore = UserStore();
  String _email = "";
  String _password = "";
  final _progressDialog = ProgressDialogComponent();
  Future changeEmail(String value) async {
    _email = value;
  }

  Future changePassword(String value) async {
    _password = value;
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      _userStore.loadUser();
      _progressDialog.hide();
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'user-not-found') {
        _progressDialog.hide();
        throw ExceptionUsers(
            "Usuário incorreto ou não consta no banco de dados!");
      } else if (exception.code == 'wrong-password') {
        _progressDialog.hide();
        throw ExceptionUsers("O Email tá certinho, já a senha, tá incorreta!");
      } else {
        _progressDialog.hide();
        throw ExceptionUsers("Algo deu errado!");
      }
      // return ApiResponse.error((exception as FirebaseAuthException).message);
    }
  }
}

class ExceptionUsers implements Exception {
  String message;

  ExceptionUsers(this.message);
}

 /* if (userCredential.user != null) {
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection("Users")
            .doc(userCredential.user!.uid)
            .get();

        UserModel person =
            UserModel.fromFirestore(snapshot.data() as Map<String, dynamic>);
        _userStore.loadUser();
        return ApiResponse.sucess(true);
      } else {
        return ApiResponse.error("Eita!! deu alguma bronca!");
      } */