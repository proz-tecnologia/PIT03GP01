// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class GeneralTexts {
  //APP BAR REGION  BEGINS
  static Widget Home_page_title = const Text(
    "Olá,\nGrupo 1 / Proz",
    style: TextStyle(
      color: Color.fromARGB(245, 0, 0, 0),
      fontWeight: FontWeight.bold,
    ),
  );

  static String home_page_mais = "Saídas";
  static String home_page_deposito_icon = "Entradas";
  static String home_page_sonhos_icon = "Sonhos";
  static String home_page_controle_icon = "Controle\nFinanceiro";
  // APP BAR REGION ENDS

  //HOME PAGE REGION BEGINS
  static Widget verTudo = Text("Ver tudo",
      style: TextStyle(
          fontSize: 12,
          color: Colors.white.withOpacity(0.4),
          fontWeight: FontWeight.bold));

  static Widget extrato = const Text(
    "EXTRATO",
    style: TextStyle(
        fontSize: 14,
        color: Color.fromARGB(255, 253, 250, 250),
        fontWeight: FontWeight.bold),
  );
  //HOME PAGE REGION ENDS

}
