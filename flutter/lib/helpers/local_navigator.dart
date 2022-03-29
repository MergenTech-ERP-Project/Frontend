// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class LocalNavigator extends StatelessWidget {
  final String? initialRoute;
  final Route<dynamic>? Function(RouteSettings)? generateRoute;

  const LocalNavigator({
    Key? key,
    required this.initialRoute,
    required this.generateRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorController.navigationKey,
      initialRoute: initialRoute,
      onGenerateRoute: generateRoute,
    );
  }
}
