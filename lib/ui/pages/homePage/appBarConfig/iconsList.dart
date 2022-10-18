import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/homePage/appBarConfig/iconsListsConfig.dart';
import 'package:srminhaeiro/widgets/TextsAndStrings.dart';

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
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FormatIconText(
                  icon: Icons.wallet_rounded,
                  text: GeneralTexts.home_page_deposito_icon),
              FormatIconText(
                  icon: Icons.cloud, text: GeneralTexts.home_page_sonhos_icon),
              FormatIconText(
                  icon: Icons.leaderboard_outlined,
                  text: GeneralTexts.home_page_controle_icon),
              FormatIconText(
                  icon: Icons.more_vert, text: GeneralTexts.home_page_mais),
            ],
          ),
        ),
      ),
    );
  }
}
