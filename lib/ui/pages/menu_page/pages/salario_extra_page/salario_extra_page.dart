import 'package:flutter/material.dart';

class salarioExtraPage extends StatelessWidget {
  static String route = "salario";

  const salarioExtraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 119, 119, 126),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color.fromARGB(255, 27, 27, 28),
          onPressed: () => Navigator.pop(context),
          label: const Text("voltar")),
      body: Container(),
    );
  }
}
