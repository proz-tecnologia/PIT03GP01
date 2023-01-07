// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class Notificacoes extends StatefulWidget {
  static String route = "notificacoes";
  const Notificacoes({super.key});

  @override
  State<Notificacoes> createState() => _NotificacoesState();
}

class _NotificacoesState extends State<Notificacoes> {
  bool _exibirInvest = false;
  bool _modoPrivacidade = false;
  bool _modoBiometria = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      backgroundColor: Colors.grey[350],
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Voltar"),
        backgroundColor: Colors.grey[800],
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Configurar',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            SwitchListTile(
              title: const Text("Exibir meus investimentos no app"),
              subtitle: const Text(
                  "Quando ativado, possibilita a visualização de seus investimentos."),
              //activeColor: Colors.blueGrey,
              selected: false,
              //secondary: Icon(Icons.mobile_off_outlined),
              value: _exibirInvest,
              onChanged: (valor) {
                setState(() {
                  _exibirInvest = valor;
                });
                print("Modo Avião: $_exibirInvest");
              },
            ),
            SwitchListTile(
              title:
                  const Text("Deixar minha conta visível na lista de contatos"),
              subtitle: const Text(
                  "Quando ativado, possibilita a visualização de seu saldo"),
              value: _modoPrivacidade,
              onChanged: (valor) {
                setState(() {
                  _modoPrivacidade = valor;
                });
                print("Notificações: $_modoPrivacidade");
              },
            ),
            SwitchListTile(
              title: const Text("Ativar biometria"),
              subtitle: const Text(
                  "Quando ativado, a configuração se aplica a todos os apps."),
              value: _modoBiometria,
              onChanged: (valor) {
                setState(() {
                  _modoBiometria = valor;
                });
                print("Notificações: $_modoBiometria");
              },
            ),
          ],
        ),
      ),
    );
  }
}
