import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/components/alert_dialog.component.dart';
import 'package:srminhaeiro/ui/components/progress_dialog.component.dart';
import 'package:srminhaeiro/ui/pages/login_page/login_page.dart';
import 'package:srminhaeiro/ui/pages/login_page/onboarding.dart';

class CheckPage extends StatelessWidget {
  final ProgressDialogComponent _progressDialog = ProgressDialogComponent();
  final AlertDialogComponent _alertDialog = AlertDialogComponent();
  CheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _progressDialog.show("Carregando informações...");
          } else if (snapshot.hasData) {
            return const Onboarding();
          } else if (snapshot.hasError) {
            return _alertDialog.showInfo(
                title: "Ops", message: "Algo deu errado!");
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
