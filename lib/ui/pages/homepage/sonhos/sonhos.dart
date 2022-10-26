import 'package:flutter/material.dart';

class Sonhos extends StatefulWidget {
  static String route = "sonhos";

  const Sonhos({Key? key}) : super(key: key);

  @override
  State<Sonhos> createState() => _SonhosState();
}

class _SonhosState extends State<Sonhos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300],
    );
  }
}
