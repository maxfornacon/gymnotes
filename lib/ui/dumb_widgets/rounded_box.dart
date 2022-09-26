import 'package:flutter/material.dart';
import 'package:gymnotes/ui/shared/styles.dart';

class RoundedBox extends StatelessWidget {
  final Widget child;
  final bool border;

  const RoundedBox({
    Key? key,
    required this.child,
    this.border = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kcSecondaryColor,
        border: border ? Border.all(
          color: kcPrimaryColor,
          width: 2
        ) : null,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
