import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srminhaeiro/models/transacao_model.dart';
import 'package:srminhaeiro/ui/components/item_transaction.dart';
import 'package:srminhaeiro/ui/pages/homepage/controller/extrato_provider_controller.dart';

class ContaPage extends StatelessWidget {
  static String route = "conta";

  const ContaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton.extended(
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
            label: const Text("Voltar")),
        body: Center(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 16, left: 1, right: 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Conta',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Image.asset(
                      "assets/images/accounting.png",
                      height: 80,
                      width: 80,
                    ),
                  ],
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Detalhamento',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Consumer<ExtratoProvider>(
                  builder: (context, extratoProvider, child) => extratoProvider
                          .extratoProvider.isEmpty
                      ? const Center(
                          heightFactor: 24,
                          child: Text(
                            "Você ainda não tem transações",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        )
                      : Expanded(
                          child: Stack(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 154, 153, 153),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.elliptical(100, 60),
                                    bottomRight: Radius.elliptical(200, 150),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 98, 94, 94),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.elliptical(1600, 160),
                                    topRight: Radius.elliptical(1600, 160),
                                    bottomLeft: Radius.elliptical(1600, 160),
                                  ),
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 51, 49, 49),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.elliptical(1000, 160),
                                    bottomLeft: Radius.elliptical(860, 423),
                                  ),
                                ),
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemBuilder: (_, index) => Dismissible(
                                          key: ValueKey<Transaction>(
                                              extratoProvider
                                                  .extratoProvider[index]),
                                          direction:
                                              DismissDirection.endToStart,
                                          resizeDuration:
                                              const Duration(milliseconds: 300),
                                          background: Container(
                                            alignment:
                                                AlignmentDirectional.centerEnd,
                                            color: Colors.redAccent,
                                            child: const Icon(
                                              Icons.delete_forever,
                                              size: 40,
                                            ),
                                          ),
                                          onDismissed: (direction) =>
                                              extratoProvider
                                                  .removeByPosition(index),
                                          child: ItemTransaction(
                                            extratoProvider
                                                .extratoProvider[index],
                                            key: ValueKey<int>(index),
                                          ),
                                        ),
                                    itemCount:
                                        extratoProvider.extratoProvider.length),
                              ),
                            ],
                          ),
                        ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 8.0,
                    right: 8,
                    top: 16,
                  ),
                  child: SizedBox(
                    child: Text(
                      "Sr.Minhaeiro",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
