import 'package:flutter/material.dart';
import 'package:srminhaeiro/pages/tabsPages/homePage/inicio_Tab.dart';
import 'package:srminhaeiro/pages/tabsPages/rankingPage/ranking_Tab.dart';
import 'package:srminhaeiro/pages/tabsPages/sonhosPage/sonhos_Tab.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Expanded(
        child: TabBarView(children: [
          Inicio_Tab(),
          Sonhos_Tab(),
          Ranking_Tab(),
        ]),
      ),
    );
  }
}
