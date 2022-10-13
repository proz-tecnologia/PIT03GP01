// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class GeneralTexts {
  //APP BAR REGION  BEGINS
  static Widget Home_page_title = const Text("Sr. M i n h a e i r o",
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500));
  static Widget Home_page_title_back = const Text("Sr. M i n h a e i r o",
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500));

  // TAB BAR MENU NAME REGION BEGINS
  static Widget home_page_Home_icon = const Text(
    "INÍCIO",
    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
  );
  static Widget home_page_trending_icon = const Text(
    "RANKING",
    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
  );
  static Widget home_page_setting_icon = const Text(
    "SONHOS",
    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
  );
  // TAB BAR MENU NAME REGION ENDS

  // APP BAR REGION ENDS

  //HOME PAGE REGION BEGINS
  static Widget inicio_page_body = const Text("INÍCIO");

  //HOME PAGE REGION ENDS

  //SONHOS PAGE REGION BEGINS
  static Widget sonhos_page_body = const Text("SONHOS");

  //SONHOS PAGE REGION ENDS

  //RANKING PAGE REGION BEGINS
  static Widget ranking_page_body = const Text("RANKING");

  //RANKING PAGE REGION ENDS

  //DRAWER REGION BEGINS
  static Widget drawer_User_Name = const Text(
    "Conta do Usuário",
    style: TextStyle(color: Colors.black, fontSize: 20),
  );

  static Widget drawer_Sign_Out = const Text(
    "SAIR",
    style: TextStyle(color: Colors.black, fontSize: 16),
  );
  static Widget drawer_princpal = const Text("Pricipal");
  static Widget drawer_theme = const Text("Tema escuro");
  static Widget drawer_Invite = const Text("Convide um amigo");
  static Widget drawer_notifications = const Text("notificações");
  static Widget drawer_About_App = const Text("Sobre o app");

  //DRAWER REGION ENDS

}
