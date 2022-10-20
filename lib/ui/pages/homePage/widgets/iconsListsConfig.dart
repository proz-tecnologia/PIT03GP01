import 'package:flutter/material.dart';

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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(4),
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.grey.shade300,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                      color: Colors.grey.withOpacity(0.1))
                ],
              ),
              child: IconButton(onPressed: () {}, icon: Icon(icon, size: 34)),
            ),
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
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
