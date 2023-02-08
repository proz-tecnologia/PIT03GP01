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
            topLeft: Radius.elliptical(25, 50),
            // topRight: Radius.elliptical(60, 20),
            bottomLeft: Radius.elliptical(25, 50),
            bottomRight: Radius.elliptical(25, 50),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 31, 30, 30),
        label: const Text("Voltar"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 230, 230, 233),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
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
                  const Divider(
                    thickness: 3,
                    endIndent: 150,
                  ),
                  const Divider(
                    thickness: 3,
                    endIndent: 20,
                    indent: 150,
                  ),
                  const Divider(
                    thickness: 3,
                    endIndent: 150,
                    indent: 40,
                  ),
                  const Divider(
                    thickness: 3,
                    endIndent: 60,
                    indent: 150,
                  ),
                  const Divider(
                    thickness: 3,
                    endIndent: 150,
                    indent: 120,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, left: 8, right: 8, bottom: 64.0),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.elliptical(25, 50),
                              // topRight: Radius.elliptical(60, 20),
                              bottomLeft: Radius.elliptical(25, 50),
                              bottomRight: Radius.elliptical(25, 50),
                            ),
                            color: Colors.grey[800],
                          ),
                          child: const Center(
                            child: Text(
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
