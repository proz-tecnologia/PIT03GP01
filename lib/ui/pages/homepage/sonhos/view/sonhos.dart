import 'package:flutter/material.dart';

import 'package:srminhaeiro/ui/pages/homepage/sonhos/view/criar_sonho_page.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/view/meus_sonhos_page.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/ajudapage/ajuda_page.dart';
import 'package:srminhaeiro/Util/group_button_config.dart';

class Sonhos extends StatefulWidget {
  static String route = "sonhos";

  const Sonhos({Key? key}) : super(key: key);

  @override
  State<Sonhos> createState() => _SonhosState();
}

class _SonhosState extends State<Sonhos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
              topRight: Radius.circular(0)),
        ),
        backgroundColor: Colors.black,
        label: const Text("Voltar"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              /*  mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max, */
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Sonhos",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                      "assets/images/sonhospage.png",
                      height: 200,
                      width: 200,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 8, right: 8, bottom: 64.0),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: Colors.black,
                        ),
                        child: const Text(
                          " O sr. minhaeiro entende a importância dos sonhos, e os seus, são muito importantes para nós, então, vamos torná-lo realidade?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 12),
                  child: GroupButtonConfig(
                      changecolor: true,
                      text: const Text(
                        "Criar Sonhos",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onpressed: () =>
                          Navigator.pushNamed(context, DreamCreate.route)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: GroupButtonConfig(
                      changecolor: true,
                      text: const Text(
                        "Meus Sonhos",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onpressed: () =>
                          Navigator.pushNamed(context, MeusSonhosPage.route)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                  ),
                  child: TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, AjudaPage.route),
                      child: const Text(
                        "Precisa de ajuda?",
                        style: TextStyle(fontSize: 16),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
