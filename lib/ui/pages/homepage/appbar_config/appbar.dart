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
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 234, 230, 230),
              Color.fromARGB(255, 244, 242, 242),
              Color.fromARGB(255, 231, 225, 225),
              Color.fromARGB(255, 224, 220, 220),
              Color.fromARGB(255, 192, 178, 178),
              Color.fromARGB(255, 165, 151, 151),
            ],
          )),
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
          radius: 30,
          backgroundImage: user.photoURL == null
              ? const NetworkImage(
                  "https://icon-library.com/images/no-user-image-icon/no-user-image-icon-27.jpg")
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
