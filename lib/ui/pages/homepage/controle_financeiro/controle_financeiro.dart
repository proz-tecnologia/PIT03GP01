import 'package:flutter/material.dart';

class Controle extends StatefulWidget {
  static String route = "controle";

  const Controle({Key? key}) : super(key: key);

  @override
  State<Controle> createState() => _ControleState();
}

class _ControleState extends State<Controle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          label: const Text("Voltar")),
      backgroundColor: Colors.black38,
    );
  }
}
