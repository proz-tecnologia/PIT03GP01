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
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 27, 27, 28),
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
              child: SizedBox(
                height: 70,
                width: 360,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 27, 27, 28),
                      side: BorderSide(width: 3, color: Colors.white)),
                  onPressed: () => onpressed,
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
      ],
    );
  }
}
