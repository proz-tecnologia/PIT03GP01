import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mask/mask.dart';
import 'package:provider/provider.dart';
import 'package:srminhaeiro/ui/components/progress_dialog.component.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.list.controller.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/ajudapage/faq_card_config.dart';

class AjudaPage extends StatelessWidget {
  static String route = "ajuda";
  const AjudaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final progressDialog = ProgressDialogComponent();
    final formKey = GlobalKey<FormState>();
    final username =
        FirebaseAuth.instance.currentUser!.displayName!.split(" ").first;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 152, 152, 154),
        floatingActionButton: SpeedDial(
          activeBackgroundColor: const Color.fromARGB(255, 31, 30, 30),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(0)),
          ),
          overlayColor: Colors.black,
          overlayOpacity: 0.4,
          backgroundColor: const Color.fromARGB(255, 62, 60, 60),
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    topRight: Radius.circular(0)),
              ),
              child: const Icon(Icons.message),
              label: "Fale conosco",
              onTap: () {
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
                      title: Text("Olá, $username como podemos te ajudar?"),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: formKey,
                            child: TextFormField(
                              maxLines: 5,
                              maxLength: 300,
                              decoration: const InputDecoration(
                                hintText: "Informe o que deseja aqui ",
                                helperText: "Envie sua dúvida, sugestão...",
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
                                prefix: Text("R\$ "),
                              ),
                              keyboardType: TextInputType.text,
                              controller: textController,
                              validator: (value) =>
                                  Mask.validations.generic(value),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.elliptical(25, 50),
                                      // topRight: Radius.elliptical(60, 20),
                                      bottomLeft: Radius.elliptical(25, 50),
                                      bottomRight: Radius.elliptical(25, 50),
                                    ),
                                  ),
                                  backgroundColor: const Color(0xff413d3d),
                                ),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    Navigator.pop(context);
                                    progressDialog.show("Enviando pergunta...");
                                    await Future.delayed(
                                        const Duration(seconds: 1));

                                    progressDialog.hide();
                                  }
                                },
                                child: const Text("Enviar")),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.elliptical(25, 50),
                                      // topRight: Radius.elliptical(60, 20),
                                      bottomLeft: Radius.elliptical(25, 50),
                                      bottomRight: Radius.elliptical(25, 50),
                                    ),
                                  ),
                                  backgroundColor: const Color(0xff413d3d),
                                ),
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Cancelar"))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            SpeedDialChild(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      topRight: Radius.circular(0)),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_sharp),
                label: "Voltar")
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: Container(),
              floating: true,
              title: const Center(child: Text("Precisa de ajuda?")),
              toolbarTextStyle: const TextStyle(fontSize: 60),
              backgroundColor: const Color.fromARGB(255, 230, 230, 233),
              expandedHeight: 120,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: const Color.fromARGB(255, 31, 30, 30),
                ),
                title: const Text(
                  "F A Q",
                ),
              ),
            ),
            const FaqCardConfig(
              pergunta:
                  "Que tipo de dicas financeiras eu encontro no sr.minhaeiro?",
              resposta:
                  "Aqui você pode encontrar diversas dicas diferentes, sobre, investimento, poupar dinheiro, boas práticas financeiras e muito mais... ",
            ),
            const FaqCardConfig(
              pergunta: "O que eu encontro quando registro um sonho?",
              resposta:
                  "Irá gerar um card dos sonhos onde você encontrará um relatório mostrando informações sobre o seu sonho ",
            ),
            const FaqCardConfig(
              pergunta: "Como posso focar na realização do sonho?",
              resposta:
                  "Na área de dicas financeiras do sr.minhaeiro, você pode aprender muito com os especialistas sobre organização e foco para alcançar o seu objetivo ",
            ),
            const FaqCardConfig(
              pergunta: "Quantos sonhos eu posso ter no sr.minhaeiro?",
              resposta:
                  "Aqui no sr.minhaeiro você pode sonhar o quanto quiser, tenha quantos sonhos bem entender... ",
            ),
            const FaqCardConfig(
              pergunta: "Como posso focar na realização do sonho?",
              resposta:
                  "Na área de dicas financeiras do sr.minhaeiro, você pode aprender muito com os especialistas sobre organização e foco para alcançar o seu objetivo ",
            ),
            const FaqCardConfig(
              pergunta: "O que eu encontro quando registro um sonho?",
              resposta:
                  "Irá gerar um card dos sonhos onde você encontrará um relatório mostrando informações sobre o seu sonho ",
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
