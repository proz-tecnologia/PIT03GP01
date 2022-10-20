import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/menuPage/floatingMenuConfig.dart';
import 'package:srminhaeiro/ui/pages/menuPage/pages/AjudaPage/ajudaPage.dart';
import 'package:srminhaeiro/ui/pages/menuPage/pages/cartaoPage/cartaoPage.dart';
import 'package:srminhaeiro/ui/pages/menuPage/pages/salarioExtraPage/salarioExtraPage.dart';

Widget buildMenuButton(BuildContext context) => FloatingActionButton.extended(
      backgroundColor: Color.fromARGB(255, 253, 250, 250),
      label: const Text(
        "MENU",
        style: TextStyle(color: Color(0xff120c0c), fontWeight: FontWeight.bold),
      ),
      icon: const Icon(
        Icons.menu,
        size: 30,
        color: Color.fromARGB(245, 21, 20, 20),
      ),
      onPressed: () {
        showModalBottomSheet<void>(
          shape: const RoundedRectangleBorder(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(60)),
          ),
          context: context,
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius:
                  const BorderRadius.only(topLeft: Radius.circular(60)),
              child: Scaffold(
                floatingActionButton: FloatingActionButton.extended(
                  backgroundColor: Color(0xff120c0c),
                  label: const Text(
                    "Voltar",
                    style: TextStyle(
                        color: Color(0xfffbf1f1), fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                body: ClipRRect(
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(60)),
                  child: Container(
                    height: 500,
                    color: Color(0xfffbf1f1),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          FormatButtomMenu(
                            text: "Cartão",
                            onpressed: () =>
                                Navigator.pushNamed(context, cartaoPage.route),
                          ),
                          FormatButtomMenu(
                            text: "Salário extra",
                            onpressed: () => Navigator.pushNamed(
                                context, salarioExtraPage.route),
                          ),
                          FormatButtomMenu(
                            text: "Precisa de ajuda?",
                            onpressed: () =>
                                Navigator.pushNamed(context, AjudaPage.route),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
