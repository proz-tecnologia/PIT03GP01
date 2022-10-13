// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:srminhaeiro/widgets/textsStrings.dart';

class Inicio_Tab extends StatelessWidget {
  const Inicio_Tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 197, 176, 113),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                margin: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                height: 250,
                child: Center(child: GeneralTexts.inicio_page_body),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                margin: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                height: 250,
                child: Center(child: GeneralTexts.inicio_page_body),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                margin: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                height: 250,
                child: Center(child: GeneralTexts.inicio_page_body),
              ),
            ),
          )
        ],
      ),
    );
  }
}
