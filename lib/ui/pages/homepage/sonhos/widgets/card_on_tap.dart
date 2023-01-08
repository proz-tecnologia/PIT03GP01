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
                backgroundColor: const Color(0xff413d3d),
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
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                ),
                color: Color(0xfffbf1f1),
                boxShadow: [
                  BoxShadow(
                      inset: true,
                      blurRadius: 5,
                      offset: Offset(1, 1),
                      color: Colors.black),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, top: 40.0, bottom: 40),
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
                    padding: const EdgeInsets.only(left: 32.0, bottom: 12),
                    child: SizedBox(
                        child: Text(
                      "Valor do sonho: ${card.valorTotal.obterReal(2).toString()} ",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, bottom: 12),
                    child: SizedBox(
                      child: RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: "Valor faltante para realização: ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            )),
                        TextSpan(
                            text: value.missingValue(
                                card.valorTotal, value.currentValue),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ))
                      ])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, bottom: 12),
                    child: SizedBox(
                        child: Text(
                      "Data escolhida para realização: ${card.date.day}/${card.date.month}/${card.date.year}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 32.0, bottom: 12, right: 32),
                    child: SizedBox(
                        child: Text(
                      "Tempo restante para a realização: ${value.fullDate(card.date)}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, bottom: 12),
                    child: SizedBox(
                        child: Text(
                      "Valor das parcelas mensais: ${value.valueDivideByMonths(card.valorTotal, card.date)}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )),
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
