import 'package:flutter/material.dart';
import 'package:srminhaeiro/pages/homePage/appBarConfig/balanceValue.dart';
import 'package:srminhaeiro/pages/homePage/appBarConfig/iconsList.dart';
import 'package:srminhaeiro/pages/homePage/floatingMenu.dart';
import 'package:srminhaeiro/pages/homePage/homePageBody.dart';
import 'package:srminhaeiro/widgets/TextsAndStrings.dart';
import 'package:srminhaeiro/Util/spaceBetween.dart';

class InicialPage extends StatelessWidget {
  const InicialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd0c44e),
      floatingActionButton: buildMenuButton(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              leadingWidth: 80,
              title: GeneralTexts.Home_page_title,
              floating: true,
              backgroundColor: const Color(0xffd0c44e),
              leading: const Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 50,
              ),
              expandedHeight: 100,
              flexibleSpace: const FlexibleSpaceBar(),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_outlined))
              ],
              actionsIconTheme:
                  const IconThemeData(color: Colors.white, opacity: 40)),
          const BalanceValue(),
          const SpaceInBetween(),
          const ButtonList(),
          const HomePageBody(),
        ],
      ),
    );
  }
}
