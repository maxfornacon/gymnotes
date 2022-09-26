import 'package:flutter/material.dart';
import 'package:gymnotes/ui/shared/styles.dart';

class RoundedButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final BorderRadius borderRadius;
  final double height;

  const RoundedButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.borderRadius = const BorderRadius.all(Radius.circular(20.0)),
    this.height = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: Material(
          color: kcPrimaryColor,
          borderRadius: borderRadius,
          textStyle: const TextStyle(
            color: Colors.white70,
          ),
          child: InkWell(
            onTap: onPressed,
            borderRadius: borderRadius,
            child: Align(
              alignment: Alignment.center,
              child: child
            )
          ),
        ),
      )
    );
  }
}
