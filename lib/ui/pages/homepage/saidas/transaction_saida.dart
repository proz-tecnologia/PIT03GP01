// ignore_for_file: use_build_context_synchronously

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srminhaeiro/ui/components/progress_dialog.component.dart';

import '../../../../models/transacao_model.dart';
import '../controller/extrato_provider_controller.dart';

class SaidasTransaction extends StatefulWidget {
  static String route = "saidas";
  const SaidasTransaction({Key? key}) : super(key: key);

  @override
  State<SaidasTransaction> createState() => _SaidasTransactionState();
}

class _SaidasTransactionState extends State<SaidasTransaction> {
  final transactionType = [
    TransactionTypeOption(
      'Saidas',
      TransactionType.EXPENSE,
      Colors.green,
    ),
  ];
  final _formKey = GlobalKey<FormState>();
  final _transactionType = TransactionType.EXPENSE;
  var _description = "";
  var _value = 0.0;
  var _dateTime = DateTime.now();
  final dateController = TextEditingController();
  final progressdialog = ProgressDialogComponent();

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 230, 230, 233),
        floatingActionButton: Visibility(
          visible: showFab,
          child: FloatingActionButton.extended(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(25, 50),
                // topRight: Radius.elliptical(60, 20),
                bottomLeft: Radius.elliptical(25, 50),
                bottomRight: Radius.elliptical(25, 50),
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 31, 30, 30),
            onPressed: () {
              Navigator.pop(context);
            },
            label: const Text("Voltar"),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          textAlign: TextAlign.start,
                          'Saídas',
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 3,
                        endIndent: 150,
                      ),
                      const Divider(
                        thickness: 3,
                        endIndent: 20,
                        indent: 150,
                      ),
                      const Divider(
                        thickness: 3,
                        endIndent: 150,
                        indent: 40,
                      ),
                      const Divider(
                        thickness: 3,
                        endIndent: 60,
                        indent: 150,
                      ),
                      const Divider(
                        thickness: 3,
                        endIndent: 150,
                        indent: 120,
                      ),
                      const Icon(
                        Icons.west_sharp,
                        size: 100,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Descrição",
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
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.redAccent),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.redAccent),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16)),
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              maxLength: 30,
                              validator: (value) {
                                if (value!.length < 3 || value.length > 30) {
                                  return "Campo deve ter ao menos 3 e no máximo 30 caractéres.";
                                }
                                return null;
                              },
                              onSaved: ((newValue) => _description = newValue!),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                CurrencyTextInputFormatter(
                                    locale: "pt_BR",
                                    decimalDigits: 2,
                                    symbol: '')
                              ],
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: const InputDecoration(
                                labelText: "Valor",
                                hintText: "0,00",
                                prefix: Text("R\$ "),
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
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.redAccent),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.redAccent),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16)),
                                ),
                              ),
                              maxLength: 10,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Informe um valor.";
                                }
                                final valueDouble = double.parse(value
                                    .replaceAll('.', '')
                                    .replaceAll(',', '.'));
                                if (valueDouble == 0) {
                                  return "Informe um valor diferente de 0";
                                }
                                return null;
                              },
                              onSaved: (newValue) => _value = double.parse(
                                  newValue!
                                      .replaceAll('.', '')
                                      .replaceAll(',', '.')),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: dateController,
                              keyboardType: TextInputType.datetime,
                              decoration: const InputDecoration(
                                labelText: "Data da Operação",
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
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.redAccent),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.redAccent),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16)),
                                ),
                              ),
                              maxLength: 10,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Informe uma data.";
                                }
                                return null;
                              },
                              onTap: () async {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                DateTime? date = await showDatePicker(
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
                                    lastDate: DateTime.now(),
                                    initialDate: _dateTime,
                                    context: context);
                                _dateTime = date ?? _dateTime;
                                dateController.text =
                                    "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}";
                              },
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      progressdialog
                                          .show("Registrando transação...");
                                      await Future.delayed(
                                          const Duration(seconds: 2));
                                      final transaction = Transaction(
                                          transactionType: _transactionType,
                                          dateTime: _dateTime,
                                          description: _description,
                                          value: _value);

                                      Provider.of<ExtratoProvider>(context,
                                              listen: false)
                                          .add(transaction);
                                      progressdialog.hide();
                                      Navigator.pop(context);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.elliptical(25, 50),
                                        // topRight: Radius.elliptical(60, 20),
                                        bottomLeft: Radius.elliptical(25, 50),
                                        bottomRight: Radius.elliptical(25, 50),
                                      ),
                                    ),
                                    backgroundColor:
                                        const Color.fromARGB(255, 31, 30, 30),
                                    padding: const EdgeInsets.all(16),
                                  ),
                                  child: const Icon(
                                    Icons.west_sharp,
                                    size: 32,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            )));
  }
}

class TransactionTypeOption {
  String label;
  TransactionType type;
  Color color;

  TransactionTypeOption(this.label, this.type, this.color);
}
