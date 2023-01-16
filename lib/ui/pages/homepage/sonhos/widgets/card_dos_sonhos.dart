// ignore_for_file: use_build_context_synchronously

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:mask/mask/mask.dart';
import 'package:provider/provider.dart';
import 'package:srminhaeiro/ui/components/alert_dialog.component.dart';
import 'package:srminhaeiro/ui/components/progress_dialog.component.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.list.controller.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/model/card_sonho_model.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/widgets/card_on_tap.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../controller/card.controller.dart';

class CardDosSonhos extends StatelessWidget {
  final CardSonhoModel card;

  final TextEditingController valorController = TextEditingController();
  final CardListController _controller = CardListController();
  final _alertDialog = AlertDialogComponent();
  final CardController modelValue = CardController();
  final _progressDialog = ProgressDialogComponent();
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
            onTap: () => showModalBottomSheet<void>(
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 12.0,
                              top: 12,
                              bottom: 8,
                            ),
                            child: SizedBox(
                              width: 110,
                              child: Text(
                                textAlign: TextAlign.start,
                                card.nomeSonho.toLowerCase(),
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
                                                    topLeft:
                                                        Radius.circular(12),
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
                                                    topLeft:
                                                        Radius.circular(12),
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
                                            onChanged: (va) {
                                              value.currentValue = double.parse(
                                                  va
                                                      .replaceAll(".", "")
                                                      .replaceAll(",", "."));
                                            }
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
                                              onPressed: () async {
                                                Navigator.pop(context);
                                                await Future.delayed(
                                                    const Duration(seconds: 2));
                                                _progressDialog.show(
                                                    "Adicionado parcela ao sonhos");
                                                await Future.delayed(
                                                    const Duration(seconds: 1));

                                                _progressDialog.hide();
                                                value.plus(value.currentValue);
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
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            _progressDialog
                                                .show("Removendo card...");
                                            await Future.delayed(
                                                const Duration(seconds: 2));
                                            _progressDialog.hide();
                                            value.removeCard(card);
                                          },
                                          child: const Text("Sim, eu quero.")),
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
                                          child: const Text("Ops, não quero."))
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
                    child: Consumer<CardListController>(
                      builder: (context, value, child) => SfLinearGauge(
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _deleteSonho(CardSonhoModel model) async {
    _progressDialog.show("Excluindo...");
    final response = await _controller.cloudFirestoneDelete(model);
    _progressDialog.hide();
    if (response.isError) {
      _alertDialog.showInfo(title: "Eita!", message: response.message!);
    }
  }
}
