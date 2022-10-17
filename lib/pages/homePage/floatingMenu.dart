import 'package:flutter/material.dart';

Widget buildMenuButton() => FloatingActionButton.extended(
      backgroundColor: const Color(0xff877A01),
      label: const Text("MENU"),
      icon: const Icon(
        Icons.menu,
      ),
      onPressed: () {},
    );
