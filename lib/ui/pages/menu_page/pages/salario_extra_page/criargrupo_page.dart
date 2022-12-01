import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/salario_extra_page/group_button_config.dart';

class GroupCreate extends StatelessWidget {
  static String route = "group";

  const GroupCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Voltar"),
        backgroundColor: const Color(0xff413d3d),
        onPressed: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 150),
                child: Text(
                  "Salário Extra",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0, bottom: 0),
                child: Image.asset(
                  "assets/images/salarioextra.png",
                  opacity: const AlwaysStoppedAnimation(0.05),
                  height: 200,
                  width: 200,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, left: 16.0, bottom: 16),
            child: TextButtonConfig(
              ontap: () {},
              text: const Text(
                " Qtd. participantes",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 3,
            indent: 16,
            endIndent: 16,
            color: Colors.grey[300],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 16,
              bottom: 16,
            ),
            child: TextButtonConfig(
              ontap: () {},
              text: const Text(
                " Valor da parcela mensal R\$",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 3,
            indent: 16,
            endIndent: 16,
            color: Colors.grey[300],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 16,
              bottom: 16,
            ),
            child: TextButtonConfig(
              ontap: () {},
              text: const Text(
                " Cartão de crédito",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 3,
            indent: 16,
            endIndent: 16,
            color: Colors.grey[300],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 16,
              bottom: 16,
            ),
            child: TextButtonConfig(
              ontap: () {},
              text: const Text(
                " Escolha o mês para receber",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 3,
            indent: 16,
            endIndent: 16,
            color: Colors.grey[300],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 16,
              bottom: 16,
            ),
            child: TextButtonConfig(
              ontap: () {},
              text: const Text(
                " Nome do grupo",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 3,
            indent: 16,
            endIndent: 16,
            color: Colors.grey[300],
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
                    onPressed: () {},
                    child: const Text("Adicionar Grupo")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
