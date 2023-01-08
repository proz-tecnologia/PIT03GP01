import 'package:flutter/material.dart';

class Notificacoes extends StatelessWidget {
  static String route = "notificacoes";
  const Notificacoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Voltar"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
