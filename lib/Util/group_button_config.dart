import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class GroupButtonConfig extends StatelessWidget {
  final Text? text;
  final VoidCallback? onpressed;
  final bool? changecolor;

  const GroupButtonConfig(
      {this.changecolor, this.onpressed, this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16)),
        color: changecolor! ? Colors.black : Colors.grey,
        boxShadow: const [
          BoxShadow(
              inset: true,
              blurRadius: 4,
              offset: Offset(-2, -2),
              color: Color.fromARGB(255, 29, 28, 28)),
          BoxShadow(
              inset: true,
              blurRadius: 4,
              offset: Offset(1, 1),
              color: Color.fromARGB(255, 32, 30, 30)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onpressed,
            child: SizedBox(
              height: 100,
              child: Center(
                child: text,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextButtonConfig extends StatelessWidget {
  final Widget text;
  final VoidCallback ontap;
  const TextButtonConfig({required this.ontap, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ontap,
      child: text,
    );
  }
}
