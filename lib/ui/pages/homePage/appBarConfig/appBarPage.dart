import 'package:flutter/material.dart';
import 'package:srminhaeiro/texts/TextsAndStrings.dart';

class AppBarSliver extends StatelessWidget {
  const AppBarSliver({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        elevation: 20,
        leadingWidth: 80,
        title: GeneralTexts.Home_page_title,
        backgroundColor: Color.fromARGB(255, 253, 250, 250),
        leading: const Icon(
          Icons.account_circle,
          color: Color.fromARGB(245, 21, 20, 20),
          size: 60,
        ),
        expandedHeight: 100,
        flexibleSpace: const FlexibleSpaceBar(),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.visibility_outlined))
        ],
        actionsIconTheme:
            IconThemeData(color: Color.fromARGB(245, 0, 0, 0), opacity: 40));
  }
}
