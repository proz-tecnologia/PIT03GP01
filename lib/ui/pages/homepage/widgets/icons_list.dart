import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/homepage/widgets/icons_lists_config.dart';
import 'package:srminhaeiro/texts/texts_and_strings.dart';
import '../controle_financeiro/controle_financeiro.dart';
import '../entradas/extrato_entradas.dart';
import '../saidas/saidas_extrato.dart';
import '../sonhos/view/sonhos.dart';

class ButtonList extends StatelessWidget {
  const ButtonList({
    Key? key,
  }) : super(key: key);

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
                    Navigator.pushNamed(context, ExtratoEntradas.route),
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
                onTap: () => Navigator.pushNamed(context, Controle.route),
                child: SizedBox(
                  child: FormatIconText(
                      icon: Icons.pie_chart_outline,
                      text: GeneralTexts.home_page_controle_icon),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, ExtratoSaidas.route),
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
