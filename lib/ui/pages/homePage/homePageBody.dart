import 'package:flutter/material.dart';
import 'package:srminhaeiro/widgets/TextsAndStrings.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(60), topLeft: Radius.circular(60)),
          child: Container(
            height: 500,
            color: Color.fromARGB(221, 245, 245, 243),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    color: Color.fromARGB(255, 15, 14, 1),
                    height: 1,
                    width: 350,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SizedBox(
                            width: 100,
                            height: 50,
                            child: GeneralTexts.extrato,
                          ),
                        ),
                        const SizedBox(
                          width: 170,
                        ),
                        SizedBox(
                          width: 80,
                          height: 50,
                          child: GeneralTexts.verTudo,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
