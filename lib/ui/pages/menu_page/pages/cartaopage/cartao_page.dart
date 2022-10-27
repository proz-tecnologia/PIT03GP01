// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CartaoPage extends StatelessWidget {
  static String route = "cartao";

  const CartaoPage({super.key});

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
