import 'package:flutter/material.dart';
import 'package:gymnotes/ui/shared/styles.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const RoundedButton(
      this.text, {
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Material(
          color: kcPrimaryColor,
          borderRadius: BorderRadius.circular(20.0),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(20.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white70,
                ),
              )
            )
          ),
        ),
      )
    );
  }
}
