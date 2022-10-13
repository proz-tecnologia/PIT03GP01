import 'package:flutter/material.dart';
import 'package:srminhaeiro/widgets/textsStrings.dart';
import 'package:srminhaeiro/widgets/themeChange.dart';

class DrawerConfig extends StatelessWidget {
  const DrawerConfig({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 99, 79, 13),
                Color(0xffdfcb89),
                Color.fromARGB(140, 220, 205, 69),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          height: 240,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(child: SizedBox()),
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Colors.brown,
                    size: 48,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: GeneralTexts.drawer_User_Name),
                const Expanded(child: SizedBox()),
                SizedBox(
                    width: double.maxFinite,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                color: Color.fromARGB(180, 84, 76, 54),
                                width: 3)),
                        onPressed: () {},
                        child: GeneralTexts.drawer_Sign_Out)),
              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.white,
          height: 5,
        ),
        ListTile(
          selected: true,
          leading: const Icon(
            Icons.home,
          ),
          title: GeneralTexts.drawer_princpal,
        ),
        ListTile(
          leading: const Icon(
            Icons.person_add,
          ),
          title: GeneralTexts.drawer_Invite,
        ),
        ListTile(
          leading: const Icon(
            Icons.notifications,
          ),
          title: GeneralTexts.drawer_notifications,
        ),
        ListTile(
          leading: const Icon(
            Icons.dark_mode_outlined,
          ),
          title: GeneralTexts.drawer_theme,
          trailing: const Themechange(),
        ),
        ListTile(
          leading: const Icon(
            Icons.info,
          ),
          title: GeneralTexts.drawer_About_App,
        ),
      ]),
    );
  }
}
