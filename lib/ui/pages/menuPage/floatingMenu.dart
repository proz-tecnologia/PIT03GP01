import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/menuPage/floatingMenuConfig.dart';
import 'package:srminhaeiro/ui/pages/menuPage/pages/ajuda.dart';
import 'package:srminhaeiro/ui/pages/menuPage/pages/cartaoPage.dart';
import 'package:srminhaeiro/ui/pages/menuPage/pages/salarioExtraPage.dart';

Widget buildMenuButton(BuildContext context) => FloatingActionButton.extended(
      backgroundColor: Color.fromARGB(255, 27, 27, 28),
      label: const Text("MENU"),
      icon: const Icon(
        Icons.menu,
        size: 30,
      ),
      onPressed: () {
        showModalBottomSheet<void>(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(60),
            ),
          ),
          context: context,
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(60), topLeft: Radius.circular(60)),
              child: Scaffold(
                floatingActionButton: FloatingActionButton.extended(
                  backgroundColor: Color.fromARGB(255, 27, 27, 28),
                  label: const Text(
                    "Voltar",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                body: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(60),
                      topLeft: Radius.circular(60)),
                  child: Container(
                    height: 500,
                    color: Colors.grey.shade300,
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
