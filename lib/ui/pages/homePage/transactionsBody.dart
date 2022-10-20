import 'package:flutter/material.dart';
import 'package:srminhaeiro/texts/TextsAndStrings.dart';

class TransactionBody extends StatelessWidget {
  const TransactionBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(60)),
          child: Container(
            height: 500,
            color: Color(0xff120c0c),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Container(
                      color: Color.fromARGB(255, 253, 250, 250),
                      height: 1,
                      width: 350,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: SizedBox(
                            width: 100,
                            height: 50,
                            child: GeneralTexts.extrato,
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          height: 50,
                          child: GeneralTexts.verTudo,
                        ),
                      ],
                    ),
                  ),

                  //herbert implementations
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
