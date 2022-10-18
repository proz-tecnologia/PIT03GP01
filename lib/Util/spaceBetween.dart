import 'package:flutter/material.dart';

class SpaceInBetween40px extends StatelessWidget {
  const SpaceInBetween40px({
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

class SpaceInBetween8px extends StatelessWidget {
  const SpaceInBetween8px({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 8,
      ),
    );
  }
}
