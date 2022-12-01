import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srminhaeiro/models/transacao_model.dart';
import 'package:srminhaeiro/ui/pages/homepage/controller/extrato_provider_controller.dart';


class EntradasTransaction extends StatefulWidget {
  static String route = "entradas";
  const EntradasTransaction({Key? key}) : super(key: key);

  @override
  State<EntradasTransaction> createState() => _EntradasTransactionState();
}

class _EntradasTransactionState extends State<EntradasTransaction> {
  final transactionType = [
    TransactionTypeOption(
        'Entradas',
        TransactionType.INCOME,
        Colors.green,
    ),];
  final _formKey = GlobalKey<FormState>();
  final _transactionType = TransactionType.INCOME;
  var _description = "";
  var _value = 0.0;
  var _dateTime = DateTime.now();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: () {
      Navigator.pop(context);
    },
    label: const Text("Voltar"),),

      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
          Row(
          children: [
          Expanded(
          child: ClipRRect(
          borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 32),
          color: const Color(0xff413d3d),
          child: const Text(
            'Entradas',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              color: Color(0xfffff9f9),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
    ],
    ),

      Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Descrição"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      locale: "pt_BR", decimalDigits: 2, symbol: '')
                ],
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                    labelText: "Valor",
                    hintText: "0,00",
                    prefix: Text("R\$ "),
                    ),
                maxLength: 10,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe um valor.";
                  }
                  final valueDouble = double.parse(
                      value.replaceAll('.', '').replaceAll(',', '.'));
                  if (valueDouble == 0) {
                    return "Informe um valor diferente de 0";
                  }
                  return null;
                },
                onSaved: (newValue) => _value = double.parse(
                    newValue!.replaceAll('.', '').replaceAll(',', '.')),
              ),
              const SizedBox(
                height: 16,
              ),

              TextFormField(
                controller: dateController,
                keyboardType: TextInputType.datetime,
                decoration:
                const InputDecoration(labelText: "Data da Operação"),
                maxLength: 10,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe uma data.";
                  }
                  return null;
                },
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  DateTime? date = await showDatePicker(
                    builder:
                        (context, child)=> Theme(
                         data:
                         Theme.of(context).copyWith(colorScheme:const ColorScheme.dark(
                           primary: Colors.black,
                           onPrimary: Colors.white,
                           onSurface: Colors.grey
                         )),
                      child: child!,),
                      firstDate:
                      DateTime.now().subtract(const Duration(days: 360)),
                      lastDate: DateTime.now(),
                      initialDate: _dateTime, context: context);
                  _dateTime = date ?? _dateTime;
                  dateController.text =
                  "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}";
                },
              ),
            const SizedBox(height: 32,),
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final transaction = Transaction(
                          transactionType: _transactionType,
                          dateTime: _dateTime,
                          description: _description,
                          value: _value);

                      Provider.of<ExtratoProvider>(context, listen: false)
                          .add(transaction);
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    const Color.fromARGB(255, 33, 32, 32),
                    padding: const EdgeInsets.all(16),
                  ),
                  child:const Icon(
                    Icons.east_sharp,
                    size: 32,
                  )),
              ],
            ),
            ],
            ),
            ),

          ),
        ),
    ]))));
  }
}
class TransactionTypeOption {
  String label;
  TransactionType type;
  Color color;

  TransactionTypeOption(this.label, this.type, this.color);
}