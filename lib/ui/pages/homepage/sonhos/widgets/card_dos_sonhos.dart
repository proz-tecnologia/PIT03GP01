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
  final formkey = GlobalKey<FormState>();
  CardDosSonhos(
    this.card, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CardListController>(
      builder: (context, value, child) => ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.elliptical(25, 50),
          // topRight: Radius.elliptical(60, 20),
          bottomLeft: Radius.elliptical(25, 50),
          bottomRight: Radius.elliptical(25, 50),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 8.0, right: 8, top: 16, bottom: 16),
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CardOnTap(card)),
            ),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(25, 50),
                  // topRight: Radius.elliptical(60, 20),
                  bottomLeft: Radius.elliptical(25, 50),
                  bottomRight: Radius.elliptical(25, 50),
                ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 12.0,
                            top: 12,
                            bottom: 8,
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              overflow: TextOverflow.fade,
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
                                builder: (context, value, child) => AlertDialog(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.elliptical(25, 50),
                                      // topRight: Radius.elliptical(60, 20),
                                      bottomLeft: Radius.elliptical(25, 50),
                                      bottomRight: Radius.elliptical(25, 50),
                                    ),
                                  ),
                                  title: Text(
                                      "Qual o valor da parcela que deseja adicionar ao seu sonho '${card.nomeSonho}' ?"),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Form(
                                        key: formkey,
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
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 2,
                                                    color: Colors.redAccent),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(16),
                                                    bottomLeft:
                                                        Radius.circular(16),
                                                    bottomRight:
                                                        Radius.circular(16)),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 2,
                                                    color: Colors.redAccent),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(16),
                                                    bottomLeft:
                                                        Radius.circular(16),
                                                    bottomRight:
                                                        Radius.circular(16)),
                                              ),
                                              prefix: Text("R\$ "),
                                            ),
                                            keyboardType: TextInputType.number,
                                            controller: valorController,
                                            validator: (value) =>
                                                Mask.validations.money(value),
                                            onChanged: (va) {
                                              value.sonhoParcela = double.parse(
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
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.elliptical(25, 50),
                                                  // topRight: Radius.elliptical(60, 20),
                                                  bottomLeft:
                                                      Radius.elliptical(25, 50),
                                                  bottomRight:
                                                      Radius.elliptical(25, 50),
                                                ),
                                              ),
                                              backgroundColor:
                                                  const Color(0xff413d3d),
                                            ),
                                            onPressed: () async {
                                              if (formkey.currentState!
                                                  .validate()) {
                                                Navigator.pop(context);
                                                _progressDialog.show(
                                                    "Adicionado parcela ao sonhos");

                                                value.currentElement(card.uid!,
                                                    value.sonhoParcela);
                                                await _updateSonho(
                                                    card.uid!, card);

                                                _progressDialog.hide();
                                              }
                                            },
                                            child: const Text("Adicionar")),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.elliptical(25, 50),
                                                  // topRight: Radius.elliptical(60, 20),
                                                  bottomLeft:
                                                      Radius.elliptical(25, 50),
                                                  bottomRight:
                                                      Radius.elliptical(25, 50),
                                                ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 300,
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
                          Icons.delete_forever,
                          color: Colors.red[300],
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => Consumer<CardListController>(
                              builder: (context, value, child) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.elliptical(25, 50),
                                    // topRight: Radius.elliptical(60, 20),
                                    bottomLeft: Radius.elliptical(25, 50),
                                    bottomRight: Radius.elliptical(25, 50),
                                  ),
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
                                                topLeft:
                                                    Radius.elliptical(25, 50),
                                                // topRight: Radius.elliptical(60, 20),
                                                bottomLeft:
                                                    Radius.elliptical(25, 50),
                                                bottomRight:
                                                    Radius.elliptical(25, 50),
                                              ),
                                            ),
                                            backgroundColor:
                                                const Color(0xff413d3d),
                                          ),
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            _progressDialog
                                                .show("Removendo card...");
                                            await _deleteSonho(card);
                                            _progressDialog.hide();
                                            value.removeCard(card);
                                          },
                                          child: const Text("Sim, eu quero.")),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft:
                                                    Radius.elliptical(25, 50),
                                                // topRight: Radius.elliptical(60, 20),
                                                bottomLeft:
                                                    Radius.elliptical(25, 50),
                                                bottomRight:
                                                    Radius.elliptical(25, 50),
                                              ),
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
                            value: card.valorAtual,
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

  // ignore: unused_element
  _updateSonho(String uid, CardSonhoModel model) async {
    _progressDialog.show("Adicionando parcela...");
    final response = await _controller.cloudFirestoneUpdate(uid, model);
    _progressDialog.hide();
    if (response.isError) {
      _alertDialog.showInfo(title: "Ops!", message: response.message!);
    }
  }
}
