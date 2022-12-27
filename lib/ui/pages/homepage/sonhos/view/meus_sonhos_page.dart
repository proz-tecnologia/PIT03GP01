import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.list.controller.dart';
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
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
              topRight: Radius.circular(0)),
        ),
        backgroundColor: const Color(0xff413d3d),
        label: const Text("Voltar"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.webp"),
                fit: BoxFit.fill)),
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
                          const Text(
                            "Você ainda não tem sonhos, adicionados...",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    : Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
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
