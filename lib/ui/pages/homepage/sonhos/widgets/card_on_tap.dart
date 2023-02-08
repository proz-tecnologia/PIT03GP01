import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:provider/provider.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.list.controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../model/card_sonho_model.dart';

class CardOnTap extends StatelessWidget {
  final CardSonhoModel card;
  const CardOnTap(this.card, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CardListController>(
      builder: (context, value, child) => Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton.extended(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(25, 50),
                bottomLeft: Radius.elliptical(25, 50),
                bottomRight: Radius.elliptical(25, 50),
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 31, 30, 30),
            label: const Text(
              "Voltar",
              style: TextStyle(
                  color: Color(0xfffbf1f1), fontWeight: FontWeight.bold),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Color(0xfffbf1f1),
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/dreamsback.jpg")),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    top: 16.0,
                  ),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 30,
                              width: 200,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                card.nomeSonho,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: SfLinearGauge(
                                interval: 0,
                                minimum: 0,
                                maximum: card.valorTotal,
                                barPointers: [
                                  LinearBarPointer(
                                    value: card.valorAtual,
                                    color: const Color(0xff413d3d),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: Image.asset(
                            "assets/images/esonho.png",
                            height: 100,
                            width: 100,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          child: Text(
                            "Valor do sonho:\n\n ${card.valorTotal.obterReal(2).toString()}\n ",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(children: [
                                const TextSpan(
                                    text:
                                        "Valor faltante para realização:\n\n ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    )),
                                TextSpan(
                                    text:
                                        "${value.missingValue(card.valorTotal, card.valorAtual)}\n",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ))
                              ])),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          child: Text(
                            textAlign: TextAlign.start,
                            "Início do sonho:\n\n ${card.date.day}/${card.date.month}/${card.date.year}\n",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          child: Text(
                            textAlign: TextAlign.start,
                            "Realização do sonho:\n\n ${card.date2.day}/${card.date2.month}/${card.date2.year}\n",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          child: Text(
                            textAlign: TextAlign.start,
                            "Tempo para a realização:\n\n ${value.fullDate(card.date, card.date2)}\n",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          child: Text(
                            "Parcelas mensais:\n\n ${value.valueDivideByMonths(double.parse(value.missingValueTostring(card.valorTotal, value.sonhoParcela)), card.date, card.date2)}",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
