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
              margin: const EdgeInsets.all(4),
              height: 60,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Color(0xff120c0c),
                boxShadow: [
                  BoxShadow(
                      inset: true,
                      blurRadius: 4,
                      offset: Offset(5, 5),
                      color: Color(0xfffff9f9).withOpacity(0.75))
                ],
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    icon,
                    size: 40,
                    color: Color.fromARGB(255, 253, 250, 250),
                  )),
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
