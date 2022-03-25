import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget smallScreen;
  final Widget? mediumScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    required this.smallScreen,
    this.mediumScreen,
  }) : super(key: key);

  static bool isLargeScreen(context) =>
      MediaQuery.of(context).size.width / MediaQuery.of(context).size.height >=
      1; //1.2
  static bool isSmallScreen(context) =>
      MediaQuery.of(context).size.width / MediaQuery.of(context).size.height <
      1; //0.8

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => isLargeScreen(context)
            ? largeScreen
            : (isSmallScreen(context)
                ? smallScreen
                : mediumScreen ?? largeScreen));
  }
}
