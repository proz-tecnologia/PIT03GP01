import 'package:flutter/material.dart';

class Privacidade extends StatelessWidget {
  static String route = "privacidade";
  const Privacidade({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Voltar"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey[500],
        title: const Text(
          'Configurar',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              'Preferência de notificações',
              style: TextStyle(fontSize: 25),
            ),
            const Text(
              'Escolha quais notificações do seu aplicativo deseja receber na tela do celular.',
              style: TextStyle(fontSize: 21),
            ),
            Center(
              child: Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  color: Colors.grey[500],
                  child: const Text(
                    'É importante saber: Quais suas notificações de seugurança e de transações na sua conta e cartão. Exemplo: Notificações de compras, pagamentos.',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
