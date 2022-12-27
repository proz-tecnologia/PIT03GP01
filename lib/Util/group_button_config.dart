import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class GroupButtonConfig extends StatelessWidget {
  final Text? text;
  final VoidCallback? onpressed;
  final bool? changecolor;

  const GroupButtonConfig(
      {required this.changecolor, this.onpressed, this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        color: changecolor! ? const Color(0xff413d3d) : Colors.grey,
        boxShadow: const [
          BoxShadow(
              inset: true,
              blurRadius: 4,
              offset: Offset(-2, -2),
              color: Color.fromARGB(255, 75, 75, 75)),
          BoxShadow(
              inset: true,
              blurRadius: 4,
              offset: Offset(1, 1),
              color: Color.fromARGB(255, 100, 99, 99)),
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
