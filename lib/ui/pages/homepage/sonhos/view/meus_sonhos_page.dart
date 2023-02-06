import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srminhaeiro/Util/group_button_config.dart';

import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.list.controller.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/view/criar_sonho_page.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/widgets/card_dos_sonhos.dart';

class MeusSonhosPage extends StatelessWidget {
  static String route = "meussonhos";

  const MeusSonhosPage({super.key});

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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/dreamsback.jpg")),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 32.0, bottom: 32),
                child: Text(
                  "Meus  Sonhos",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              Consumer<CardListController>(
                builder: (context, value, child) => value.sonhoCardList.isEmpty
                    ? Column(
                        children: [
                          Center(
                              child: Image.asset(
                            "assets/images/alonee.png",
                            fit: BoxFit.cover,
                          )),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(
                              child: Text(
                                textAlign: TextAlign.center,
                                "Você ainda não tem sonhos, adicionados...",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 32, left: 8.0, right: 8.0, bottom: 12),
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
                                onpressed: () => Navigator.pushReplacementNamed(
                                    context, DreamCreate.route)),
                          ),
                        ],
                      )
                    : Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: value.sonhoCardList.length,
                          itemBuilder: (context, index) => CardDosSonhos(
                            value.sonhoCardList[index],
                          ),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
