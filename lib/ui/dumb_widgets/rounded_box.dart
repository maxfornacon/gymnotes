import 'package:flutter/material.dart';
import 'package:gymnotes/ui/shared/styles.dart';

class RoundedBox extends StatelessWidget {
  final Widget child;

  const RoundedBox({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kcSecondaryColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
