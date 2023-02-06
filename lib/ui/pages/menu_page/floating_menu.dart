import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srminhaeiro/ui/pages/login_page/controller/google_login.controller.dart';
import 'package:srminhaeiro/ui/pages/login_page/login_page.dart';
import 'package:srminhaeiro/ui/pages/menu_page/floating_menu_config.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/ajudapage/ajuda_page.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/conta_menu_page/conta_extrato.page.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/profile/profile_page.dart';

Widget buildMenuButton(BuildContext context) => FloatingActionButton.extended(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
            topRight: Radius.circular(0)),
      ),
      backgroundColor: const Color.fromARGB(255, 253, 250, 250),
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
          isScrollControlled: true,
          backgroundColor: const Color(0xfffbf1f1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
          ),
          context: context,
          builder: (BuildContext context) {
            return FractionallySizedBox(
              heightFactor: 0.92,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(60)),
                child: Scaffold(
                  floatingActionButton: FloatingActionButton.extended(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          topRight: Radius.circular(0)),
                    ),
                    backgroundColor: const Color(0xfffbf1f1),
                    label: const Text(
                      "Voltar",
                      style: TextStyle(
                          color: Color(0xff120c0c),
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  body: ClipRRect(
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(60)),
                    child: Container(
                      color: const Color(0xff120c0c),
                      child: Center(
                        child: ListView(
                          children: <Widget>[
                            Container(
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 234, 230, 230),
                                  Color.fromARGB(255, 244, 242, 242),
                                  Color.fromARGB(255, 231, 225, 225),
                                  Color.fromARGB(255, 224, 220, 220),
                                  Color.fromARGB(255, 192, 178, 178),
                                  Color.fromARGB(255, 165, 151, 151),
                                ],
                              )),
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [],
                                ),
                              ),
                            ),
                            FormatButtomMenu(
                              text: const Text(
                                "Conta",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 12, 12, 12),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24),
                              ),
                              onpressed: () =>
                                  Navigator.pushNamed(context, ContaPage.route),
                              color: const Color(0xfffbf1f1),
                            ),
                            FormatButtomMenu(
                              text: const Text(
                                "Dados cadastrais",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 12, 12, 12),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24),
                              ),
                              onpressed: () => Navigator.pushNamed(
                                  context, ProfilePage.route),
                              color: const Color.fromARGB(255, 198, 190, 190),
                            ),
                            FormatButtomMenu(
                              text: const Text(
                                "Precisa de ajuda?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xfffbf1f1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24),
                              ),
                              onpressed: () =>
                                  Navigator.pushNamed(context, AjudaPage.route),
                              color: const Color.fromARGB(255, 82, 79, 79),
                            ),
                            FormatButtomMenu(
                              text: const Text(
                                "Sair do App",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xfffbf1f1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24),
                              ),
                              onpressed: () {
                                final provider =
                                    Provider.of<GoogleLoginController>(context,
                                        listen: false);
                                provider.googleLogout();
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    LoginPage.route, (route) => false);
                              },
                              color: const Color.fromARGB(255, 33, 32, 32),
                            ),
                            Container(
                              height: 150,
                              color: const Color(0xff120c0c),
                            ),
                          ],
                        ),
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
