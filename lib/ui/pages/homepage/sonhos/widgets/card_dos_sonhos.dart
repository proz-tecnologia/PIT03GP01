import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:mask/mask/mask.dart';
import 'package:provider/provider.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.list.controller.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/model/card_sonho_model.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/widgets/card_on_tap.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../controller/card.controller.dart';
import '../model/menu_item_model.dart';

class CardDosSonhos extends StatelessWidget {
  final CardSonhoModel card;
  final MenuItemModel menu = const MenuItemModel();
  final TextEditingController valorController = TextEditingController();
  final CardController modelValue = CardController();

  CardDosSonhos(
    this.card, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CardListController>(
      builder: (context, value, child) => ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 8.0, right: 8, top: 32, bottom: 32),
          child: InkWell(
            onDoubleTap: () => showModalBottomSheet<void>(
              isScrollControlled: true,
              backgroundColor: const Color(0xfffbf1f1),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
              ),
              context: context,
              builder: (BuildContext context) {
                return CardOnTap(card);
              },
            ),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Color(0xfffff9f9),
                boxShadow: [
                  BoxShadow(
                      inset: true,
                      blurRadius: 4,
                      offset: Offset(-4, -4),
                      color: Color(0xffe9dede)),
                  BoxShadow(
                      inset: true,
                      blurRadius: 4,
                      offset: Offset(1, 1),
                      color: Color(0xffe9dede)),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12.0, top: 12, bottom: 8, right: 14),
                            child: SizedBox(
                              width: 110,
                              child: Text(
                                textAlign: TextAlign.start,
                                card.nomeSonho,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.add_circle,
                              color: Color(0xff413d3d),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    Consumer<CardListController>(
                                  builder: (context, value, child) =>
                                      AlertDialog(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                          topRight: Radius.circular(0)),
                                    ),
                                    title: Text(
                                        "Qual o valor da parcela que deseja adicionar ao seu sonho '${card.nomeSonho}' ?"),
                                    actions: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          maxLength: 14,
                                          inputFormatters: [
                                            CurrencyTextInputFormatter(
                                                decimalDigits: 2,
                                                locale: 'pt_BR',
                                                symbol: "")
                                          ],
                                          decoration: const InputDecoration(
                                            hintText: "00,00",
                                            helperText: "ex: R\$ 5.000,00",
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12)),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12)),
                                            ),
                                            prefix: Text("R\$ "),
                                          ),
                                          keyboardType: TextInputType.number,
                                          controller: valorController,
                                          validator: (value) =>
                                              Mask.validations.money(value),
                                          onChanged: (va) =>
                                              value.currentValue +=
                                                  double.parse(va
                                                      .replaceAll(".", "")
                                                      .replaceAll(",", ".")),
                                          /*  modelValue.adicionarvalor =
                                                    double.parse(va
                                                        .replaceAll(".", "")
                                                        .replaceAll(",", ".")
                                                        ), */
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(12),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  12),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12),
                                                          topRight:
                                                              Radius.circular(
                                                                  0)),
                                                ),
                                                backgroundColor:
                                                    const Color(0xff413d3d),
                                              ),
                                              onPressed: () {
                                                /* value.current += value.current; */
                                                modelValue.adicionarvalor ==
                                                    card.adicionarValor;
                                                value.addmoney(
                                                    card.adicionarValor,
                                                    card.valorAtual);
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Adicionar")),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(12),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  12),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12),
                                                          topRight:
                                                              Radius.circular(
                                                                  0)),
                                                ),
                                                backgroundColor:
                                                    const Color(0xff413d3d),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text("Cancelar"))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 110,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 12.0,
                            ),
                            child: Text(
                              card.valorTotal.obterReal(2).toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          )),
                      IconButton(
                        icon: Icon(
                          Icons.remove_circle,
                          color: Colors.red[300],
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => Consumer<CardListController>(
                              builder: (context, value, child) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                      topRight: Radius.circular(0)),
                                ),
                                title: Text(
                                    "Quer realmente apagar o seu sonho '${card.nomeSonho}' ?"),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12),
                                                  topRight: Radius.circular(0)),
                                            ),
                                            backgroundColor:
                                                const Color(0xff413d3d),
                                          ),
                                          onPressed: () {
                                            value.removeCard(card);
                                            Navigator.pop(context);
                                          },
                                          child:
                                              const Text("Sim, infelizmente!")),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12),
                                                  topRight: Radius.circular(0)),
                                            ),
                                            backgroundColor:
                                                const Color(0xff413d3d),
                                          ),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text(
                                              "Não, foi sem querer!"))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, right: 15, bottom: 8),
                    child: SfLinearGauge(
                      interval: 0,
                      minimum: 0,
                      maximum: card.valorTotal,
                      barPointers: [
                        LinearBarPointer(
                          value: value.plus(value.currentValue),
                          color: const Color(0xff413d3d),
                        )
                      ],
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
