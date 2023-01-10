import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/components/alert_dialog.component.dart';
import 'package:srminhaeiro/ui/pages/login_page/login_page_two.dart';
import 'package:srminhaeiro/ui/pages/login_page/onboarding.dart';

class CheckPage extends StatefulWidget {
  static String route = "check";

  const CheckPage({super.key});

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  final AlertDialogComponent _alertDialog = AlertDialogComponent();

  @override
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }

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
