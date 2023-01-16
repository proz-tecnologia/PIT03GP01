import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.list.controller.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/widgets/card_dos_sonhos.dart';

class MeusSonhosPage extends StatefulWidget {
  static String route = "meussonhos";

  const MeusSonhosPage({super.key});

  @override
  State<MeusSonhosPage> createState() => _MeusSonhosPageState();
}

class _MeusSonhosPageState extends State<MeusSonhosPage> {
  final _controller = CardListController();
  @override
  void initState() {
    _controller.cloudFirestoneGetAll();
    super.initState();
  }

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
                    ? Expanded(
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
                          child: Column(
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : Expanded(
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
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
