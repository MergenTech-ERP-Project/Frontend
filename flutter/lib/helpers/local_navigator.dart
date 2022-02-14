import 'package:flutter/material.dart';
import 'package:vtys_kalite/routing/router.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

Navigator localNavigator() => Navigator(
    key: navigatorController.navigationKey,
    initialRoute: mainFormPageRoute,
    onGenerateRoute: generateRoute,
);