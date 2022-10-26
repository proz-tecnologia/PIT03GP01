import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffbf1f1),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color(0xfffbf1f1),
          label: const Text(
            "",
            style: TextStyle(
                color: Color(0xff120c0c), fontWeight: FontWeight.bold),
          ),
          onPressed: () {},
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              title: const Center(child: Text("Precisa de ajuda?")),
              toolbarTextStyle: const TextStyle(fontSize: 60),
              backgroundColor: Color.fromARGB(255, 61, 61, 63),
              expandedHeight: 120,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: const Color(0xff120c0c),
                ),
                title: const Text(
                  "",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
