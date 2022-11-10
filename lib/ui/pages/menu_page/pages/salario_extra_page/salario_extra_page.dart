import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/ajudapage/ajuda_page.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/salario_extra_page/criargrupo_page.dart';

import 'package:srminhaeiro/ui/pages/menu_page/pages/salario_extra_page/group_button_config.dart';

class SalarioExtraPage extends StatefulWidget {
  static String route = "salario";

  const SalarioExtraPage({super.key});

  @override
  State<SalarioExtraPage> createState() => _SalarioExtraPageState();
}

class _SalarioExtraPageState extends State<SalarioExtraPage> {
  bool _checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color(0xff413d3d),
          onPressed: () {
            Navigator.pop(context);
          },
          label: const Text("Voltar")),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 80.0),
                      child: Text(
                        "Salário Extra",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/images/salarioextra.png",
                      height: 200,
                      width: 200,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 8, left: 8, right: 32.0, bottom: 64.0),
                  child: SizedBox(
                    height: 100,
                    width: 400,
                    child: Text(
                      "Aqui você pode se juntar com amigos, familiares, colegas de trabalho, e conseguir uma renda extra por mês",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 12),
                  child: GroupButtonConfig(
                    changecolor: _checkedValue,
                    text: const Text(
                      "Criar Grupo",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onpressed: _checkedValue
                        ? () => Navigator.pushNamed(context, GroupCreate.route)
                        : null,
                  ),
                ),
                const Text(
                  "Termos e Condições",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Container(
                  width: 200,
                  alignment: Alignment.center,
                  child: CheckboxListTile(
                    title: const Text(
                      "Li e Aceito",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    value: _checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        _checkedValue = newValue!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: const Color(0xff413d3d),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 128),
                  child: TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, AjudaPage.route),
                      child: const Text("Precisa de ajuda?")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
