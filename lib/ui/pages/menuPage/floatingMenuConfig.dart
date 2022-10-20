import 'package:flutter/material.dart';

class FormatButtomMenu extends StatelessWidget {
  final String text;
  final String? value;
  final VoidCallback? onpressed;
  const FormatButtomMenu({
    Key? key,
    this.onpressed,
    required this.text,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Container(
            margin: const EdgeInsets.all(2),
            height: 70,
            width: 360,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Color(0xff120c0c),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                    color: Colors.grey.withOpacity(0.5))
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onpressed,
                  child: SizedBox(
                    height: 70,
                    width: 360,
                    child: Center(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
