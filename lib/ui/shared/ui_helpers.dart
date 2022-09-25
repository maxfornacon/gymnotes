import 'package:flutter/cupertino.dart';

/// Horizontal Spacing
const Widget hSpaceTiny = SizedBox(width: 5);
const Widget hSpaceSmall = SizedBox(width: 10);
const Widget hSpaceRegular = SizedBox(width: 18);
const Widget hSpaceMedium = SizedBox(width: 25);
const Widget hSpaceLarge = SizedBox(width: 50);

/// Horizontal Spacing
const Widget vSpaceTiny = SizedBox(height: 5);
const Widget vSpaceSmall = SizedBox(height: 10);
const Widget vSpaceRegular = SizedBox(height: 18);
const Widget vSpaceMedium = SizedBox(height: 25);
const Widget vSpaceLarge = SizedBox(height: 50);

/// Screen Size Helpers
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenWidthPercentage(BuildContext context, {double percentage = 1}) => screenWidth(context) * percentage;
double screenHeightPercentage(BuildContext context, {double percentage = 1}) => screenHeight(context) * percentage;