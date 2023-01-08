// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:srminhaeiro/firebase_options.dart';
import 'package:srminhaeiro/ui/pages/homepage/homepage.dart';
import 'package:srminhaeiro/ui/pages/login_page/login_page.dart';

class SplashPage extends StatefulWidget {
  static String route = "splash";
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  StreamSubscription? _streamSubscription;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => init());
    super.initState();
  }

  Future init() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    await Future.delayed(const Duration(seconds: 5));

    _streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user == null) {
        Navigator.pushReplacementNamed(context, LoginPage.route);
      } else {
        Navigator.pushReplacementNamed(context, HomePage.route);
      }
    });
  }

  @override
  void dispose() {
    _streamSubscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SizedBox(
            child: Image.asset(
              "assets/images/minhaeiroo.gif",
            ),
          ),
        ));
  }
}
