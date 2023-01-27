import 'package:srminhaeiro/repositories/login_repository.dart';
import 'package:srminhaeiro/store/user.store.dart';
import 'package:srminhaeiro/ui/components/progress_dialog.component.dart';

class LoginController {
  final LoginRepository repository = LoginRepository();
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
    await repository.signIn(email: _email, password: _password);
    _userStore.loadUser();
    _progressDialog.hide();
  }
}

class ExceptionUsers implements Exception {
  String message;

  ExceptionUsers(this.message);
}
