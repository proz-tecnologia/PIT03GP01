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
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff201919),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 7,
                    blurRadius: 10,
                    offset: const Offset(0, 8),
                    color: Colors.black.withOpacity(0.1))
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    pergunta,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    resposta /*  */,
                    style: TextStyle(color: Colors.white),
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
