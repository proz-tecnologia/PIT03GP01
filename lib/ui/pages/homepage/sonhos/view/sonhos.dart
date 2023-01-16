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
        backgroundColor: const Color.fromARGB(255, 31, 30, 30),
        label: const Text("Voltar"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Container(
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
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                            color: Colors.grey[800],
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
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 12),
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
      ),
    );
  }
}
