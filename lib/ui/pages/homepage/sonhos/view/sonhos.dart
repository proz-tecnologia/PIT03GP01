import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/view/criar_sonho_page.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/view/meus_sonhos_page.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/ajudapage/ajuda_page.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/salario_extra_page/group_button_config.dart';

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
        backgroundColor: const Color(0xff413d3d),
        label: const Text("Voltar"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 80.0),
                      child: Text(
                        "Sonhos",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/sonhospage.png",
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 8, left: 8, right: 32.0, bottom: 64.0),
                  child: SizedBox(
                    height: 100,
                    width: 400,
                    child: Text(
                      "Nós entendemos a importância dos sonhos, e seus sonhos são muito importantes para nós, e com isso, queremos te ajudar a realizá-lo",
                      // textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
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
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 12),
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
                  padding: const EdgeInsets.only(top: 8.0, bottom: 128),
                  child: TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, AjudaPage.route),
                      child: const Text("Precisa de ajuda?")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
