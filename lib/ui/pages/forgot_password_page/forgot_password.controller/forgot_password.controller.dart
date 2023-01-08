import 'package:firebase_auth/firebase_auth.dart';
import 'package:srminhaeiro/models/api_response.model.dart';
import 'package:srminhaeiro/navigator_key.dart';
import 'package:srminhaeiro/ui/components/alert_dialog.component.dart';
import 'package:srminhaeiro/ui/components/progress_dialog.component.dart';
import 'package:srminhaeiro/ui/pages/login_page/login_page_two.dart';

class ForgotPasswordController {
  String _email = "";
  AlertDialogComponent alert = AlertDialogComponent();
  final _progressDialog = ProgressDialogComponent();
  changeEmail(String value) {
    _email = value;
  }

  Future<ApiResponse<String>> forgotPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
      return ApiResponse.sucess(
          "Foi enviado um link de recuperação para o seu email");
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e.message);
      return ApiResponse.error("Eita! Deu alguma bronca");
    }
  }
}
