import 'package:firebase_auth/firebase_auth.dart';
import 'package:srminhaeiro/models/api_response.model.dart';
import 'package:srminhaeiro/ui/components/alert_dialog.component.dart';

class ForgotPasswordController {
  String _email = "";
  AlertDialogComponent alert = AlertDialogComponent();
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
