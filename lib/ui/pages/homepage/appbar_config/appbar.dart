import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/profile/pages/dados_page.dart';

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
    final user = FirebaseAuth.instance.currentUser!;
    return SliverAppBar(
        flexibleSpace: Container(
          color: const Color.fromARGB(255, 230, 230, 233),
        ),
        elevation: 40,
        leadingWidth: 80,
        centerTitle: true,
        title: user.displayName == null
            ? const Text(
                "Olá\nVisitante ",
                style: TextStyle(color: Colors.black),
              )
            : Text(
                "Olá, ${user.displayName?.split(" ").first} ${user.displayName?.split(" ").last}",
                style: const TextStyle(color: Colors.black),
              ),
        leading: InkWell(
          onTap: () => Navigator.pushNamed(context, Dados.route),
          child: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 111, 107, 107),
            radius: 60,
            child: user.photoURL == null
                ? const Icon(
                    Icons.person,
                    size: 38,
                    color: Color.fromARGB(255, 230, 230, 233),
                  )
                : ClipOval(
                    child: Image.network(
                    user.photoURL!,
                    fit: BoxFit.fill,
                    height: 50,
                    width: 50,
                  )),
          ),
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
