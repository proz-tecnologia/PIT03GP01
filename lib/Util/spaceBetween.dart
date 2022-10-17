import 'package:flutter/material.dart';

class SpaceInBetween extends StatelessWidget {
  const SpaceInBetween({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 40,
      ),
    );
  }
}
