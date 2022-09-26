import 'package:flutter/material.dart';
import 'package:gymnotes/ui/shared/responsive.dart';
import 'package:gymnotes/ui/shared/styles.dart';

class ResponsiveCard extends StatelessWidget {
  final Widget child;

  const ResponsiveCard({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: !Responsive.isMobile(context) ? kcBackgroundColor2 : kcBackgroundColor1,
      child: Center(
        child: SizedBox(
          width: !Responsive.isMobile(context) ? 500.0 : double.infinity,
          child: Card(
            color: kcBackgroundColor1,
            elevation: !Responsive.isMobile(context) ? 10 : 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: !Responsive.isMobile(context) ? const EdgeInsets.all(20.0) : null,
            child: Padding(
              padding: Responsive.isMobile(context) ? const EdgeInsets.only(
                left: 25.0,
                right: 25.0,
                bottom: 25.0,
              ) : const EdgeInsets.all(25.0),
              child: child,
            )
          )
        )
      )
    );
  }
}
