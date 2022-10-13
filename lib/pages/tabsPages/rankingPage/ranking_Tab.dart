// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:srminhaeiro/widgets/textsStrings.dart';

class Ranking_Tab extends StatelessWidget {
  const Ranking_Tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 204, 212, 143),
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
                    borderRadius: BorderRadius.circular(15)),
                height: 220,
                child: Center(child: GeneralTexts.ranking_page_body),
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
                    borderRadius: BorderRadius.circular(15)),
                height: 220,
                child: Center(child: GeneralTexts.ranking_page_body),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
