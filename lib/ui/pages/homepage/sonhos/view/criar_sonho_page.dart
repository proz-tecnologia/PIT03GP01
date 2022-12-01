import 'package:brasil_fields/brasil_fields.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mask/mask/mask.dart';
import 'package:provider/provider.dart';
import 'package:srminhaeiro/extensions/extension_double.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.controller.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.list.controller.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/dropdown.years.controller.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/model/card_sonho_model.dart';

class DreamCreate extends StatelessWidget {
  static String route = "criarsonhos";

  DreamCreate({super.key});

  /* final controller = Dropdowncontroller();
  _DreamCreateState() {
    controller.selectedValue = controller.mesesList[0];
  } */
  TextEditingController nomeSonhoController = TextEditingController();

  TextEditingController valorController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final CardController modelValue = CardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xff413d3d),
        label: const Text("Voltar"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Consumer2<CardListController, DropdownYearscontroller>(
          builder: (context, value, value2, child) => SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 32.0, top: 64),
                        child: Text(
                          "Sonhos",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 32.0, top: 64),
                        child: IconButton(
                            color: const Color(0xff120c0c),
                            icon: const Icon(Icons.add_a_photo),
                            iconSize: 40,
                            onPressed: () {
                              showModalBottomSheet<void>(
                                backgroundColor: const Color(0xfffbf1f1),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(60)),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      top: 32.0,
                                      left: 32,
                                    ),
                                    child: SizedBox(
                                      height: 120,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Alterar Foto do sonho",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                  "Selecionar na galeria")),
                                          TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                "Remover foto",
                                                style: TextStyle(
                                                    color: Colors.red[300]),
                                              ))
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 46.0, bottom: 16),
                    child: Text(
                      "Coloque um nome especial no seu sonho:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Consumer<CardListController>(
                      builder: (context, value, child) => TextFormField(
                        maxLength: 20,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        controller: nomeSonhoController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => Mask.validations.generic(value),
                        onChanged: (v) => modelValue.nomeSonho = v,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 32),
                    child: Text(
                      "Em quantos meses deseja realizar esse sonho?",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                          border: Border.all(color: Colors.black, width: 1)),
                      child: DropdownButton(
                        isExpanded: true,
                        value: value2.selectedValue,
                        items: value2.mesesList
                            .map((value) => DropdownMenuItem(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(value),
                                  ),
                                ))
                            .toList(),
                        onChanged: (v) => value2.setMesesValue(v),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 46.0,
                    ),
                    child: Text(
                      "Qual o valor total do seu sonho?",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                        inputFormatters: [
                          CurrencyTextInputFormatter(
                              decimalDigits: 2, locale: 'pt_BR', symbol: "")
                        ],
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                          ),
                          prefix: Text("R\$ "),
                        ),
                        keyboardType: TextInputType.number,
                        controller: valorController,
                        validator: (value) => Mask.validations.money(value),
                        onChanged: (va) => modelValue.sonhoValorTotal =
                            double.parse(
                                va.replaceAll(".", "").replaceAll(",", "."))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Center(
                      child: SizedBox(
                        height: 25,
                        width: 152,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff413d3d)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        duration: Duration(seconds: 2),
                                        content: Text(
                                            "Card dos sonhos gerado com sucesso!")));

                                var model = CardSonhoModel(
                                    nomeSonho: modelValue.nomeSonho,
                                    valorTotal: modelValue.sonhoValorTotal,
                                    valorAtual: modelValue.sonhovalorAtual);
                                value.addCard(model);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text("Criar sonho")),
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
