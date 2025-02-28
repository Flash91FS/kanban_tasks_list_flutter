import 'package:flutter/material.dart';

class Dimensions {
  static double mobileScreenWidth = 635;
  static double tabletScreenWidth = 1000;
  static double reallyWideScreenWidth = 1600;

  static double authenticationMaxWidth = 500;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileScreenWidth;

  static bool isTabletScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletScreenWidth &&
      MediaQuery.of(context).size.width > mobileScreenWidth;

  static bool isDesktopScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > tabletScreenWidth;
  static bool isReallyWideScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > reallyWideScreenWidth;

  static bool isSmallScreenHight(BuildContext context) => MediaQuery.of(context).size.height < 1200;
}
