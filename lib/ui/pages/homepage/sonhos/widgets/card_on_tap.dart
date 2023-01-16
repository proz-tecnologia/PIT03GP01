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
      builder: (context, value, child) => FractionallySizedBox(
        heightFactor: 0.90,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(60)),
          child: Scaffold(
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.extended(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      topRight: Radius.circular(0)),
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
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 234, 230, 230),
                    Color.fromARGB(255, 244, 242, 242),
                    Color.fromARGB(255, 231, 225, 225),
                    Color.fromARGB(255, 224, 220, 220),
                    Color.fromARGB(255, 192, 178, 178),
                    Color.fromARGB(255, 165, 151, 151),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                ),
                color: Colors.grey[300],
                boxShadow: const [
                  BoxShadow(
                      inset: true,
                      blurRadius: 5,
                      offset: Offset(1, 1),
                      color: Colors.black),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, top: 16.0, bottom: 40),
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
                                  textAlign: TextAlign.start,
                                  card.nomeSonho,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: SfLinearGauge(
                                  interval: 0,
                                  minimum: 0,
                                  maximum: card.valorTotal,
                                  barPointers: [
                                    LinearBarPointer(
                                      value: value.currentValue,
                                      color: const Color(0xff413d3d),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            child: Image.asset(
                              "assets/images/SrMinhaeiroo.png",
                              height: 120,
                              width: 120,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
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
                                text: "Valor faltante para realização:\n\n ",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                )),
                            TextSpan(
                                text:
                                    "${value.missingValue(card.valorTotal, value.currentValue)}\n",
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
                        "Data escolhida para realização:\n\n ${card.date.day}/${card.date.month}/${card.date.year}\n",
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
                        "Tempo restante para a data escolhida:\n\n ${value.fullDate(card.date)}\n",
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
                        "Valor das parcelas mensais:\n\n ${value.valueDivideByMonths(double.parse(value.missingValueTostring(card.valorTotal, value.currentValue)), card.date)}",
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
            ),
          ),
        ),
      ),
    );
  }
}
