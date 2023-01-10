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
        elevation: 20,
        leadingWidth: 80,
        title: user.displayName == null
            ? const Text(
                "Olá\nVisitante ",
                style: TextStyle(color: Colors.black),
              )
            : Text(
                "Olá\n${user.displayName}",
                style: const TextStyle(color: Colors.black),
              ),
        backgroundColor: const Color.fromARGB(255, 253, 250, 250),
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
