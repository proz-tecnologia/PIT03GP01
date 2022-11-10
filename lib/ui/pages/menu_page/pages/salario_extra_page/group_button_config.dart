import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class GroupButtonConfig extends StatelessWidget {
  final Text? text;
  final VoidCallback? onpressed;
  final bool changecolor;

  const GroupButtonConfig(
      {required this.changecolor, this.onpressed, this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
        color: changecolor ? const Color(0xff413d3d) : Colors.grey,
        /*  boxShadow: [
          BoxShadow(
              inset: true,
              blurRadius: 4,
              offset: const Offset(5, 5),
              color: const Color(0xfffff9f9).withOpacity(0.5))
        ], */
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
