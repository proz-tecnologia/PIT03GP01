import 'package:flutter/material.dart';

class FaqCardConfig extends StatelessWidget {
  final String pergunta;
  final String resposta;

  const FaqCardConfig(
      {Key? key, required this.pergunta, required this.resposta})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.elliptical(25, 50),
            // topRight: Radius.elliptical(60, 20),
            bottomLeft: Radius.elliptical(25, 50),
            bottomRight: Radius.elliptical(25, 50),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 8, top: 8, left: 16, right: 16),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.elliptical(25, 50),
                    // topRight: Radius.elliptical(60, 20),
                    bottomLeft: Radius.elliptical(25, 50),
                    bottomRight: Radius.elliptical(25, 50),
                  ),
                  child: ExpansionTile(
                      collapsedBackgroundColor:
                          const Color.fromARGB(255, 31, 30, 30),
                      backgroundColor: const Color.fromARGB(255, 31, 30, 30),
                      collapsedIconColor: Colors.white,
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          pergunta,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(
                              resposta,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
