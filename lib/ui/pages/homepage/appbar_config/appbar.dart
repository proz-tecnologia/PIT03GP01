import 'package:flutter/material.dart';
import 'package:srminhaeiro/texts/texts_and_strings.dart';
import 'package:srminhaeiro/ui/pages/homepage/appbar_config/profile_page.dart';

class AppBarSliver extends StatelessWidget {
  final bool isVisible;
  final VoidCallback? onTapVisibility;

  const AppBarSliver({
    Key? key,
    required this.isVisible,
    this.onTapVisibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        elevation: 20,
        leadingWidth: 80,
        title: GeneralTexts.Home_page_title,
        backgroundColor: const Color.fromARGB(255, 253, 250, 250),
        leading: IconButton(
          icon: const Icon(Icons.account_circle,
              color: Color.fromARGB(245, 21, 20, 20)),
          iconSize: 52,
          onPressed: () => Navigator.pushNamed(context, ProfilePage.route),
        ),
        expandedHeight: 100,
        actions: [
          IconButton(
            icon: Icon(isVisible
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined),
            onPressed: onTapVisibility,
          ),
        ],
        actionsIconTheme:
            const IconThemeData(color: Color.fromARGB(245, 0, 0, 0)));
  }
}
