import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        title: user.displayName == null
            ? const Text(
                "Olá\nVisitante ",
                style: TextStyle(color: Colors.black),
              )
            : Text(
                "Olá\n${user.displayName?.split(" ").first} ${user.displayName?.split(" ").last}",
                style: const TextStyle(color: Colors.black),
              ),
        leading: CircleAvatar(
          radius: 60,
          backgroundImage: user.photoURL == null
              ? const NetworkImage(
                  "https://icon-library.com/images/2018/1644353_world-of-warcraft-world-of-warcraft-battle-for.png",
                )
              : NetworkImage(user.photoURL!),
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
