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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Stack(
          children: [
            Container(
                height: 60,
                width: 80,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  color: const Color.fromARGB(255, 31, 30, 30),
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
                  size: 40,
                  color: const Color.fromARGB(255, 253, 250, 250),
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
