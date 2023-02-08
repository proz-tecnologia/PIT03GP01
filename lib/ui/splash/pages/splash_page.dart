// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:srminhaeiro/firebase_options.dart';
import 'package:srminhaeiro/ui/pages/check_page/check_page.dart';
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
        name: "splash", options: DefaultFirebaseOptions.currentPlatform);

    await Future.delayed(const Duration(milliseconds: 4500));

    _streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user == null) {
        Navigator.pushReplacementNamed(context, LoginPage.route);
      } else {
        Navigator.pushReplacementNamed(context, CheckPage.route);
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
        backgroundColor: const Color.fromARGB(255, 230, 230, 233),
        body: Center(
          child: SizedBox(
            child: Image.asset(
              "assets/images/gif.gif",
            ),
          ),
        ));
  }
}
