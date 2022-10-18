import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/homePage/appBarConfig/appBarPage.dart';
import 'package:srminhaeiro/ui/pages/homePage/appBarConfig/balanceValue.dart';
import 'package:srminhaeiro/ui/pages/homePage/appBarConfig/iconsList.dart';
import 'package:srminhaeiro/ui/pages/menuPage/floatingMenu.dart';
import 'package:srminhaeiro/ui/pages/homePage/homePageBody.dart';
import 'package:srminhaeiro/widgets/TextsAndStrings.dart';
import 'package:srminhaeiro/Util/spaceBetween.dart';

class InicialPage extends StatelessWidget {
  static String route = "inicial";

  const InicialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: buildMenuButton(context),
      body: const CustomScrollView(
        slivers: [
          SpaceInBetween8px(),
          AppBarSliver(),
          BalanceValue(),
          SpaceInBetween40px(),
          ButtonList(),
          HomePageBody(),
        ],
      ),
    );
  }
}
