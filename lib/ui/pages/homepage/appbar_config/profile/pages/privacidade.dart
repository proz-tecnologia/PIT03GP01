import 'package:flutter/material.dart';

class Privacidade extends StatelessWidget {
  static String route = "privacidade";
  const Privacidade({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Voltar"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
