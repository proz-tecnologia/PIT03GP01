import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/homepage/widgets/extrato_list.dart';
import '../../../../../models/extrato.dart';
import '../../../../../repositories/input_repository.dart';

class ExtratoEntradas extends StatefulWidget {
  static String route = "entradas";
  const ExtratoEntradas({Key? key}) : super(key: key);

  @override
  State<ExtratoEntradas> createState() => _ExtratoEntradasState();
}

class _ExtratoEntradasState extends State<ExtratoEntradas> {
  final InputRepository inputRepository = InputRepository();
  final TextEditingController inputController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<Extrato> inputs = [];
  Extrato? deleteInput;
  int? deleteInputPosition;
  String? errorInputText;

  @override
  void initState() {
    super.initState();
    inputRepository.getInputList().then((value) {
      setState(() {
        inputs = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text("Voltar"),
        ),
        body: Center(
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
                            'Depósitos',
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
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            labelText: 'Descrição',
                            hintText: 'Viagem',
                            hintStyle:TextStyle(color:Color(0xff5e5959) ,),
                            labelStyle: TextStyle(
                              color: Color(0xff120c0c),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 32, bottom: 60, left: 8, right: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            CurrencyTextInputFormatter(
                                locale: "pt_BR", decimalDigits: 2, symbol: '')
                          ],
                          controller: inputController,
                          decoration: InputDecoration(
                            labelText: 'Adicionar dinheiro',
                            hintText: 'R\$ 0,00',
                            hintStyle:TextStyle(color:Color(0xff5e5959) ,),
                            errorText: errorInputText,
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
                          String text = inputController.text;
                          String text2 = descriptionController.text;
                          if (text.isEmpty) {
                            setState(() {
                              errorInputText = 'Adicionar um valor';
                            });
                            return;
                          }
                          setState(() {
                            Extrato newExtrato = Extrato(
                              title: text,
                              date: DateTime.now(),
                              description: text2,
                            );
                            inputs.add(newExtrato);
                          });
                          errorInputText = null;
                          inputController.clear();
                          descriptionController.clear();
                          inputRepository.saveInputList(inputs);
                        },
                        child: const Icon(
                          Icons.east_sharp,
                          size: 32,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 33, 32, 32),
                          padding: const EdgeInsets.all(16),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Extrato input in inputs)
                        ExtratoListItem(
                          input: input,
                          onDelete: onDelete,
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Seus depositos: ${inputs.length} ',
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                        onPressed: showDeleteDialog,
                        child: const Text('Limpar depositos'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff413d3d),
                          padding: const EdgeInsets.all(14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onDelete(Extrato input) {
    deleteInput = input;
    deleteInputPosition = inputs.indexOf(input);
    setState(() {
      inputs.remove(input);
    });
    inputRepository.saveInputList(inputs);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Deposito (${input.title}) foi removido! '),
        backgroundColor: Colors.blueGrey,
        action: SnackBarAction(
          label: 'Desfazer',
          textColor: const Color(0xff00d7f3),
          onPressed: () {
            setState(() {
              inputs.insert(deleteInputPosition!, deleteInput!);
            });
            inputRepository.saveInputList(inputs);
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
        content: const Text('Vai apagar todos os depositos?'),
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
                deleteAllInputs();
              },
              child: const Text('Limpar Tudo')),
        ],
      ),
    );
  }

  void deleteAllInputs() {
    setState(() {
      inputs.clear();
    });
    inputRepository.saveInputList(inputs);
  }
}
