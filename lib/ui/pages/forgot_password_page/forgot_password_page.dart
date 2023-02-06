import 'package:flutter/material.dart';
import 'package:srminhaeiro/Util/group_button_config.dart';
import 'package:srminhaeiro/ui/components/alert_dialog.component.dart';
import 'package:srminhaeiro/ui/components/progress_dialog.component.dart';
import 'package:srminhaeiro/ui/pages/forgot_password_page/forgot_password.controller/forgot_password.controller.dart';
import 'package:srminhaeiro/ui/pages/login_page/login_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  static String route = "forgot";
  ForgotPasswordPage({super.key});

  final _controller = ForgotPasswordController();
  final _progressDialog = ProgressDialogComponent();
  final _alertDialog = AlertDialogComponent();

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
      floatingActionButton: Visibility(
        visible: showFab,
        child: FloatingActionButton.extended(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(25, 50),
                // topRight: Radius.elliptical(60, 20),
                bottomLeft: Radius.elliptical(25, 50),
                bottomRight: Radius.elliptical(25, 50),
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 31, 30, 30),
            onPressed: () {
              Navigator.pushReplacementNamed(context, LoginPage.route);
            },
            label: const Text("Voltar")),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 32.0,
              ),
              child: Text(
                "Esqueci minha senha",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                "assets/images/forgot.png",
                width: 150,
                height: 150,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Insira seu email abaixo para recuperar a senha",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: TextFormField(
                  onChanged: _controller.changeEmail,
                  keyboardType: TextInputType.emailAddress,
                  showCursor: true,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                    ),
                    prefixIcon: Icon(Icons.email, color: Colors.black),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                    ),
                    labelText: "e-mail",
                    hintText: "nome@email.com",
                    labelStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GroupButtonConfig(
                changecolor: true,
                onpressed: _forgotPassword,
                text: const Text(
                  "Recuperar Senha",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Divider(
                thickness: 3,
                endIndent: 150,
              ),
            ),
            const Divider(
              thickness: 3,
              endIndent: 20,
              indent: 150,
            ),
            const Divider(
              thickness: 3,
              endIndent: 150,
              indent: 20,
            ),
            const Divider(
              thickness: 3,
              endIndent: 20,
              indent: 150,
            ),
            const Divider(
              thickness: 3,
              endIndent: 150,
              indent: 40,
            ),
            const Divider(
              thickness: 3,
              endIndent: 60,
              indent: 150,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Divider(
                thickness: 3,
                endIndent: 150,
                indent: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _forgotPassword() async {
    _progressDialog.show("Analisando requisição...");
    final response = await _controller.forgotPassword();
    if (response.isSuccess) {
      _progressDialog.hide();
      _alertDialog.showInfo(title: "Feito!", message: response.data!);
    } else {
      _progressDialog.hide();
      _alertDialog.showInfo(title: "Ops!", message: response.message!);
    }
    /*  try {
      await _controller.forgotPassword();
      return _alertDialog.showInfo(
        title: "Pronto!",
        message: "Foi enviado um link de recuperação para o seu email",
      );
    } catch (e) {
      _alertDialog.showInfo(title: "Ops!", message: "Algo deu errado!");
    } */
  }
}
