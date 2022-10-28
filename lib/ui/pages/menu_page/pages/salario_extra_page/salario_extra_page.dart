import 'package:flutter/material.dart';

class SalarioExtraPage extends StatelessWidget {
  static String route = "salario";

  const SalarioExtraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
            label: const Text("Voltar")),
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
                            'Salário Extra',
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
              ],
            ),
          ),
        ),
      ),

    );
  }
}
