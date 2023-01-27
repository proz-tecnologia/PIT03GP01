import 'package:flutter/material.dart';

class Dados extends StatelessWidget {
  static String route = "Dados";
  const Dados({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Voltar"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
