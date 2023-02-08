import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class FormatIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? value;

  const FormatIconText({
    Key? key,
    required this.icon,
    required this.text,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
                height: 70,
                width: 80,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.elliptical(25, 50),
                    // topRight: Radius.elliptical(60, 20),
                    bottomLeft: Radius.elliptical(25, 50),
                    bottomRight: Radius.elliptical(25, 50),
                  ),
                  color: const Color.fromARGB(255, 51, 49, 49),
                  boxShadow: [
                    BoxShadow(
                        inset: true,
                        blurRadius: 2,
                        offset: const Offset(2, 2),
                        color: Colors.black.withOpacity(0.6)),
                    BoxShadow(
                        inset: true,
                        blurRadius: 2,
                        offset: const Offset(-2, -2),
                        color: Colors.white.withOpacity(0.6))
                  ],
                ),
                child: Icon(
                  icon,
                  size: 35,
                  color: const Color.fromARGB(255, 230, 230, 233),
                )),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: 80,
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(245, 21, 20, 20),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
