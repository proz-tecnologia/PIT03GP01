import 'package:flutter/material.dart';

class SalarioExtraPage extends StatelessWidget {
  static String route = "salario";

  const SalarioExtraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 119, 126),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color.fromARGB(255, 27, 27, 28),
          onPressed: () => Navigator.pop(context),
          label: const Text("voltar")),
      body: Container(),
    );
  }
}
