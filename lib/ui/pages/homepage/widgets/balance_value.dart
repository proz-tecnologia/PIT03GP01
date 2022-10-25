import 'package:flutter/material.dart';

class BalanceValue extends StatelessWidget {
  final bool isVisible;

  const BalanceValue({required this.isVisible, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        child: Center(
          child: Text(
            isVisible ? "2.281,74" : "..........",
            style: const TextStyle(
                color: Color(0xff2f2a2a),
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
