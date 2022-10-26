import 'package:flutter/material.dart';
import 'package:srminhaeiro/texts/texts_and_strings.dart';
import 'package:srminhaeiro/ui/pages/menu_page/floating_menu_config.dart';

class ProfilePage extends StatelessWidget {
  static String route = "profile";
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color(0xfffbf1f1),
          label: const Text(
            "Voltar",
            style: TextStyle(
                color: Color(0xff120c0c), fontWeight: FontWeight.bold),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: const Color(0xfffbf1f1),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 8,
              ),
            ),
            SliverAppBar(
              backgroundColor: const Color(0xfffbf1f1),
              leadingWidth: 80,
              leading: IconButton(
                  color: const Color(0xff120c0c),
                  icon: const Icon(Icons.add_a_photo),
                  iconSize: 40,
                  onPressed: () {
                    showModalBottomSheet<void>(
                      backgroundColor: const Color(0xfffbf1f1),
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(60)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 32.0,
                            left: 32,
                          ),
                          child: Container(
                            height: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Alterar Foto de Perfil",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text("Usar câmera")),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text("Selecionar na galeria")),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Remover foto",
                                      style: TextStyle(color: Colors.red[300]),
                                    ))
                              ],
                            ),
                          ),
                        );
                      },
                    );
                    expandedHeight:
                    200;
                    flexibleSpace:
                    const FlexibleSpaceBar(
                      title: Text(
                        "Meu perfil",
                        style: TextStyle(color: Color(0xff120c0c)),
                      ),
                    );
                    title:
                    const Text(
                      "Grupo 1",
                      style: TextStyle(color: Color(0xff120c0c)),
                    );
                  }),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            ),
            SliverToBoxAdapter(
              child: FormatButtomMenu(
                  color: const Color.fromARGB(255, 198, 190, 190),
                  text: const Text(
                    "Dados cadastrais",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 12, 12, 12), fontSize: 24),
                  ),
                  onpressed: () {}),
            ),
            SliverToBoxAdapter(
              child: FormatButtomMenu(
                  color: const Color.fromARGB(255, 82, 79, 79),
                  text: const Text(
                    "Privacidade e segurança",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xfffbf1f1), fontSize: 24),
                  ),
                  onpressed: () {}),
            ),
            SliverToBoxAdapter(
              child: FormatButtomMenu(
                  color: const Color.fromARGB(255, 33, 32, 32),
                  text: const Text(
                    "Notificações",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xfffbf1f1), fontSize: 24),
                  ),
                  onpressed: () {}),
            ),
            SliverToBoxAdapter(
              child: FormatButtomMenu(
                  color: Color.fromARGB(255, 176, 45, 45),
                  text: const Text(
                    "Sair do App",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xfffbf1f1), fontSize: 24),
                  ),
                  onpressed: () {}),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 290,
                color: const Color(0xff120c0c),
              ),
            )
          ],
        ),
      ),
    );
  }
}