import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.list.controller.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/widgets/card_dos_sonhos.dart';

import '../widgets/snack_bar_sonhos_info.dart';

class MeusSonhosPage extends StatelessWidget {
  static String route = "meussonhos";

  const MeusSonhosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff413d3d),
        centerTitle: true,
        title: const Text(
          "M e u s - S o n h o s",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xff413d3d),
        label: const Text("Voltar"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          Consumer<CardListController>(
            builder: (context, value, child) => value.sonhoCardList.isEmpty
                ? Expanded(
                    child: Container(
                    color: Colors.white,
                    child: FractionallySizedBox(
                      heightFactor: 0.70,
                      child: Column(
                        children: [
                          Image.asset("assets/images/alone.jpg"),
                          const Text(
                            "Você ainda não tem sonhos...",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ))
                : Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: value.sonhoCardList.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => snackBarSonhosInfo(context),
                        child: CardDosSonhos(
                          value.sonhoCardList[index],
                        ),
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
