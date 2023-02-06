// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srminhaeiro/models/extrato.dart';
import 'package:srminhaeiro/ui/pages/homepage/controller/extrato_provider_controller.dart';

class BalanceValue extends StatelessWidget {
  final bool isVisible;
  final double incomingValue;
  final double outcomingValue;

  const BalanceValue(
      {required this.isVisible,
      super.key,
      this.incomingValue = 0,
      this.outcomingValue = 0});
  double get total => incomingValue - outcomingValue;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer<ExtratoProvider>(
        builder: (context, extratoProvider, child) => SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  isVisible
                      ? '${(extratoProvider.getTotalIncoming - extratoProvider.getTotalOutcoming).formatBRL}'
                      : "..........",
                  style: const TextStyle(
                      color: Color(0xff2f2a2a),
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        isVisible
                            ? '+ ${(extratoProvider.getTotalIncoming).formatBRL}'
                            : "..........",
                        style: const TextStyle(
                            color: Color(0xff2f2a2a),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        isVisible
                            ? '- ${(extratoProvider.getTotalOutcoming).formatBRL}'
                            : "..........",
                        style: const TextStyle(
                            color: Color(0xff2f2a2a),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
