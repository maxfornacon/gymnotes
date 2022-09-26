import 'package:flutter/material.dart';
import 'package:gymnotes/ui/shared/styles.dart';

AppBar getAppBar(String title, List<Widget>? actions) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        color: kcForegroundColor,
      ),
    ),
    actions: actions,
    elevation: 0,
    backgroundColor: kcBackgroundColor1,
  );
}
//
// class CustomAppBar extends StatelessWidget {
//   final String title;
//   final List<Widget> actions;
//
//   const CustomAppBar({
//     Key? key,
//     required this.title,
//     required this.actions
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text(title),
//       actions: actions,
//     );
//   }
// }
