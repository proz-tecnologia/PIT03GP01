import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class FormatButtomMenu extends StatelessWidget {
  final Text text;
  final String? value;
  final VoidCallback? onpressed;
  final Color? color;
  const FormatButtomMenu(
      {Key? key, this.onpressed, required this.text, this.value, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: color,
            /*  boxShadow: [
              BoxShadow(
                  inset: true,
                  blurRadius: 4,
                  offset: Offset(5, 5),
                  color: Color(0xfffff9f9).withOpacity(0.5))
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
        ),
      ],
    );
  }
}
