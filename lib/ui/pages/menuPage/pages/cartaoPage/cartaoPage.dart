import 'package:flutter/material.dart';

class cartaoPage extends StatelessWidget {
  static String route = "cartao";

  const cartaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 201, 201, 201),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color.fromARGB(255, 27, 27, 28),
          onPressed: () => Navigator.pop(context),
          label: const Text("voltar")),
      body: Container(),
    );
  }
}
