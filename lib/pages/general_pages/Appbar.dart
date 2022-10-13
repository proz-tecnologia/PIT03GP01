import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:srminhaeiro/drawer/drawer.dart';
import 'package:srminhaeiro/pages/general_pages/generalPagesBody.dart';
import 'package:srminhaeiro/widgets/textsStrings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon searchIconAction = const Icon(
    Icons.search,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 99, 79, 13),
                    Color(0xffdfcb89),
                    Color.fromARGB(255, 122, 117, 33),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
            title: GeneralTexts.Home_page_title,
            actions: [
              IconButton(
                icon: searchIconAction,
                onPressed: () {
                  setState(() {
                    if (searchIconAction.icon == Icons.search) {
                      searchIconAction = const Icon(Icons.close);

                      GeneralTexts.Home_page_title = const TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          hintText: "Search...",
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      );
                    } else {
                      searchIconAction = const Icon(Icons.search);
                      GeneralTexts.Home_page_title =
                          GeneralTexts.Home_page_title_back;
                    }
                  });
                },
                alignment: Alignment.centerRight,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility_off,
                    color: Colors.black,
                  ))
            ],
            bottom: TabBar(
              indicatorColor: Color.fromARGB(255, 234, 233, 227),
              tabs: [
                Tab(child: GeneralTexts.home_page_Home_icon),
                Tab(child: GeneralTexts.home_page_setting_icon),
                Tab(child: GeneralTexts.home_page_trending_icon),
              ],
            ),
            elevation: 4,
            titleSpacing: 20,
          ),
          drawer: const DrawerConfig(),
          body: const HomePageBody(),
        ),
      ),
    );
  }
}
