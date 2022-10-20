import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/homePage/appBarConfig/appBarPage.dart';
import 'package:srminhaeiro/ui/pages/homePage/widgets/balanceValue.dart';
import 'package:srminhaeiro/ui/pages/homePage/widgets/iconsList.dart';
import 'package:srminhaeiro/ui/pages/menuPage/floatingMenu.dart';
import 'package:srminhaeiro/ui/pages/homePage/transactionsBody.dart';
import 'package:srminhaeiro/texts/TextsAndStrings.dart';
import 'package:srminhaeiro/Util/spaceBetween.dart';

class HomePage extends StatelessWidget {
  static String route = "inicial";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 27, 28),
      floatingActionButton: buildMenuButton(context),
      body: const CustomScrollView(
        slivers: [
          SpaceInBetween8px(),
          AppBarSliver(),
          BalanceValue(),
          SpaceInBetween40px(),
          ButtonList(),
          TransactionBody(),
        ],
      ),
    );
  }
}
