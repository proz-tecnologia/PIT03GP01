import 'package:flutter/material.dart';
import 'package:srminhaeiro/texts/TextsAndStrings.dart';

class BalanceValue extends StatelessWidget {
  const BalanceValue({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        child: Center(child: GeneralTexts.money),
      ),
    );
  }
}
