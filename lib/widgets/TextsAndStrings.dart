// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class GeneralTexts {
  //APP BAR REGION  BEGINS
  static Widget Home_page_title = const Text(
    "Olá,\nProz/ SOFTEX",
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );

  static Widget money = const Text(
    "R\$ 2.281,74",
    style: TextStyle(
        color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
  );
  static String home_page_mais = "Saídas";
  static String home_page_deposito_icon = "Entradas";
  static String home_page_sonhos_icon = "Sonhos";
  static String home_page_controle_icon = "Controle\nFinanceiro";
  // APP BAR REGION ENDS

  //HOME PAGE REGION BEGINS
  static Widget verTudo = const Text("Ver tudo",
      style: TextStyle(
          fontSize: 12, color: Color(0xff127919), fontWeight: FontWeight.bold));

  static Widget extrato = const Text(
    "EXTRATO",
    style: TextStyle(
        fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
  );
  //HOME PAGE REGION ENDS

  //DRAWER REGION BEGINS
  static Widget drawer_User_Name = const Text(
    "MR. Dreamer!",
    style: TextStyle(color: Colors.white, fontSize: 20),
  );

  static Widget drawer_Sign_In = const Text(
    "SIGN IN",
    style: TextStyle(color: Colors.white, fontSize: 16),
  );
  static Widget drawer_princpal = const Text("Home");
  static Widget drawer_theme = const Text("Dark theme");
  static Widget drawer_Invite = const Text("Invite a friend");
  static Widget drawer_About_App = const Text("About the app");

  //DRAWER REGION ENDS

}
