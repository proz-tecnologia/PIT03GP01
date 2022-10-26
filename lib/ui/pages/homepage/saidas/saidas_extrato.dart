import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/homepage/widgets/extrato_list.dart';
import '../../../../../models/extrato.dart';
import '../../../../../repositories/input_repository.dart';
import '../../../../../repositories/output_repository.dart';

class ExtratoSaidas extends StatefulWidget {
  static String route = "saidas";

  const ExtratoSaidas({Key? key}) : super(key: key);

  @override
  State<ExtratoSaidas> createState() => _ExtratoSaidasState();
}

class _ExtratoSaidasState extends State<ExtratoSaidas> {
  final OutputRepository outputRepository = OutputRepository();
  final TextEditingController outputController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<Extrato> outputs = [];
  Extrato? deleteOutput;
  int? deleteOutputPosition;
  String? errorOutputText;

  @override
  void initState() {
    super.initState();
    outputRepository.getOutputList().then((value) {
      setState(() {
        outputs = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        margin: const EdgeInsets.only(
                          bottom: 8,
                        ),
                        color: const Color(0xff413d3d),
                        child: const Text(
                          'Transferências',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 32,
                            color: Color(0xfffff9f9),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: descriptionController,
                        decoration: const InputDecoration(
                          labelText: 'Descrição',
                          hintText: 'Pagamento Luz',
                          labelStyle: TextStyle(
                            color: Color(0xff120c0c),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          CurrencyTextInputFormatter(
                              locale: "pt_BR", decimalDigits: 2, symbol: '')
                        ],
                        controller: outputController,
                        decoration: InputDecoration(
                          labelText: 'Transferência',
                          hintText: 'R\$ 1.500,00',
                          errorText: errorOutputText,
                          labelStyle: const TextStyle(
                            color: Color(0xff120c0c),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String text = outputController.text;
                        String text2 = descriptionController.text;
                        if (text.isEmpty) {
                          setState(() {
                            errorOutputText = 'Retirar um valor';
                          });
                          return;
                        }
                        setState(() {
                          Extrato newExtrato = Extrato(
                            title: text,
                            date: DateTime.now(),
                            description: text2,
                          );
                          outputs.add(newExtrato);
                        });
                        errorOutputText = null;
                        outputController.clear();
                        descriptionController.clear();
                        outputRepository.saveOutputList(outputs);
                      },
                      child: const Icon(
                        Icons.west,
                        size: 32,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 33, 32, 32),
                        padding: const EdgeInsets.all(16),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Extrato output in outputs)
                        ExtratoListItemOutput(
                          output: output,
                          onDelete: onDelete,
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Suas Retiradas: ${outputs.length} ',
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: showDeleteDialog,
                      child: const Text('Limpar Transferências'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff413d3d),
                        padding: const EdgeInsets.all(14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onDelete(Extrato output) {
    deleteOutput = output;
    deleteOutputPosition = outputs.indexOf(output);
    setState(() {
      outputs.remove(output);
    });
    outputRepository.saveOutputList(outputs);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Transferência (${output.title}) foi removido! '),
        backgroundColor: Colors.blueGrey,
        action: SnackBarAction(
          label: 'Desfazer',
          textColor: const Color(0xff00d7f3),
          onPressed: () {
            setState(() {
              outputs.insert(deleteOutputPosition!, deleteOutput!);
            });
            outputRepository.saveOutputList(outputs);
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void showDeleteDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Limpar Tudo?'),
        content: const Text('Vai apagar todas as Transferências?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Colors.redAccent),
              )),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                deleteAllOutputs();
              },
              child: const Text('Limpar Tudo')),
        ],
      ),
    );
  }

  void deleteAllOutputs() {
    setState(() {
      outputs.clear();
    });
    outputRepository.saveOutputList(outputs);
  }
}
