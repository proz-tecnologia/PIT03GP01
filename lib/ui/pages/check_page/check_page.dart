import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/components/alert_dialog.component.dart';
import 'package:srminhaeiro/ui/components/progress_dialog.component.dart';
import 'package:srminhaeiro/ui/pages/homepage/homepage.dart';
import 'package:srminhaeiro/ui/pages/login_page/login_page.dart';
import 'package:srminhaeiro/ui/pages/login_page/login_page_two.dart';
import 'package:srminhaeiro/ui/pages/login_page/onboarding.dart';

class CheckPage extends StatelessWidget {
  static String route = "check";
  final AlertDialogComponent _alertDialog = AlertDialogComponent();
  CheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else if (snapshot.hasData) {
            return const Onboarding();
          } else if (snapshot.hasError) {
            return _alertDialog.showInfo(
                title: "Ops", message: "Algo deu errado!");
          } else {
            return const LoginPageTwo();
          }
        },
      ),
    );
  }
}
