// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:mask/mask/mask.dart';
import 'package:provider/provider.dart';
import 'package:srminhaeiro/ui/components/alert_dialog.component.dart';
import 'package:srminhaeiro/ui/components/progress_dialog.component.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.controller.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.list.controller.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/model/card_sonho_model.dart';

class DreamCreate extends StatelessWidget {
  static String route = "criarsonhos";

  DreamCreate({super.key});

  final TextEditingController nomeSonhoController = TextEditingController();

  final TextEditingController dateController = TextEditingController();

  final TextEditingController valorController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final CardController modelValue = CardController();
  DateTime mydatetime = DateTime.now();
  final _progressDialog = ProgressDialogComponent();
  final _alertDialog = AlertDialogComponent();

  final CardListController _controller = CardListController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton.extended(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12)),
        ),
        backgroundColor: const Color.fromARGB(255, 31, 30, 30),
        label: const Text("Voltar"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Consumer<CardListController>(
          builder: (context, value, child) => SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Sonhos",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
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
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 46.0,
                    ),
                    child: Text(
                      "Coloque um nome especial no seu sonho:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Consumer<CardListController>(
                      builder: (context, value, child) => TextFormField(
                        maxLength: 10,
                        decoration: const InputDecoration(
                          hintText: "Nome do seu sonho aqui",
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
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
                  const Text(
                    textAlign: TextAlign.center,
                    "Escolha uma data para realizar seu sonho:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: dateController,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                          ),
                          labelText: "Data de realização"),
                      maxLength: 10,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty ||
                            mydatetime.isBefore(DateTime.now())) {
                          return "Informe uma data válida.";
                        }
                        return null;
                      },
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        DateTime? date = await showDatePicker(
                            locale: const Locale('pt', 'BR'),
                            builder: (context, child) => Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: const ColorScheme.dark(
                                        primary: Colors.white,
                                        onPrimary: Colors.black,
                                        onSurface: Colors.white,
                                        surface: Colors.black),
                                    dialogBackgroundColor: Colors.black,
                                  ),
                                  child: child!,
                                ),
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 360)),
                            lastDate: DateTime(2072, 12, 31),
                            initialDate: mydatetime,
                            context: context);
                        mydatetime = date ?? mydatetime;
                        dateController.text =
                            "${mydatetime.day}/${mydatetime.month}/${mydatetime.year}";
                      },
                    ),
                  ),
                  const Text(
                    "Informe o valor total do seu sonho:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16.0, left: 16, right: 16),
                    child: TextFormField(
                        maxLength: 10,
                        inputFormatters: [
                          CurrencyTextInputFormatter(
                              decimalDigits: 2, locale: 'pt_BR', symbol: "")
                        ],
                        decoration: const InputDecoration(
                          hintText: "00,00",
                          helperText: "ex: R\$ 5.000,00",
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
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
                    padding: const EdgeInsets.only(
                      left: 32.0,
                      right: 32,
                      bottom: 32,
                    ),
                    child: Center(
                      child: SizedBox(
                        height: 60,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                      topRight: Radius.circular(0)),
                                ),
                                backgroundColor:
                                    const Color.fromARGB(255, 31, 30, 30)),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _progressDialog.show("Gerando card dos sonhos");
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                _progressDialog.hide();
                                var model = CardSonhoModel(
                                    nomeSonho: modelValue.nomeSonho,
                                    valorTotal: modelValue.sonhoValorTotal,
                                    valorAtual: modelValue.sonhovalorAtual,
                                    adicionarValor: modelValue.adicionarvalor,
                                    date: mydatetime);
                                value.addCard(model);

                                Navigator.pop(context);
                              }
                            },
                            child: const Text(
                              "Criar sonho",
                              style: TextStyle(fontSize: 16),
                            )),
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

  _addCardDosSonhos() async {
    _progressDialog.show("Gerando card dos sonhos");
    var response = await _controller.cloudFirestoreAdd();
    _progressDialog.hide();
    if (response.isError) {
      _alertDialog.showInfo(title: "Eita!", message: response.message!);
    }
  }
}
