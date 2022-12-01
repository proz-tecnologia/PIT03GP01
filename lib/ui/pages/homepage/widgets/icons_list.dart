import 'package:flutter/material.dart';
//import 'package:srminhaeiro/ui/pages/homepage/controle_financeiro/bloc_state.dart';
import 'package:srminhaeiro/ui/pages/homepage/widgets/icons_lists_config.dart';
import 'package:srminhaeiro/texts/texts_and_strings.dart';
import '../controle_financeiro/bloc_controller.dart';
import '../controle_financeiro/controle_financeiro.dart';
//import '../entradas/extrato_entradas.dart';
import '../entradas/transaction_entrada.dart';


import '../sonhos/view/sonhos.dart';

import '../saidas/transaction_saida.dart';



class ButtonList extends StatefulWidget {
  const ButtonList({
    Key? key,
  }) : super(key: key);

  @override
  State<ButtonList> createState() => _ButtonListState();
}

class _ButtonListState extends State<ButtonList> {
  final controller = GaugeController();

  double sonhos = 0.0;

  double salarioExtra = 0.0;

  double rendaFixa = 0.0;

  double extrato = 0.0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, EntradasTransaction.route),
                child: SizedBox(
                  child: FormatIconText(
                    icon: Icons.east,
                    text: GeneralTexts.home_page_deposito_icon,
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, Sonhos.route),
                child: SizedBox(
                  child: FormatIconText(
                      icon: Icons.cloud_outlined,
                      text: GeneralTexts.home_page_sonhos_icon),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Controle.route,
                  );
                  controller.gaugeLoad(
                      sonhos: sonhos,
                      salarioExtra: salarioExtra,
                      rendaFixa: rendaFixa, extrato: extrato);
                },
                child: SizedBox(
                  child: FormatIconText(
                      icon: Icons.pie_chart_outline,
                      text: GeneralTexts.home_page_controle_icon),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, SaidasTransaction.route),
                child: SizedBox(
                  child: FormatIconText(
                      icon: Icons.west, text: GeneralTexts.home_page_mais),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
