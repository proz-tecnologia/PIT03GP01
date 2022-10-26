// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/homepage/homepage.dart';

class SplashPage extends StatefulWidget {
  static String route = "splash";
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void init() async {
    await Future.delayed(const Duration(seconds: 5));

    Navigator.pushReplacementNamed(context, HomePage.route);
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset("assets/images/minhaeiro.gif"),
        ));
  }
}
