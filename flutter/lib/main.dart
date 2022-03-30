// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vtys_kalite/models/security_user.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/security_user_controller.dart';

import 'package:vtys_kalite/screens/page_not_found.dart';
import 'package:vtys_kalite/screens/pages.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/custom_scroll_behaviour.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/authentication_controller.dart';
import 'package:vtys_kalite/utilities/style.dart';

User user = User();
SecurityUser securityUser = SecurityUser();
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AuthenticationController());

  Get.put(SecurityUserController());

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Mergen Tech',
      theme: theme(context),
      initialRoute:
          authenticationController.isLogged() ? rootRoute : loginPageRoute,
      unknownRoute: GetPage(
        name: '/not-found',
        page: () => PageNotFound(),
      ),
      getPages: pageList,
    );
  }

  theme(context) => ThemeData(
        scaffoldBackgroundColor: lightColor,
        textTheme: GoogleFonts.muliTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.black,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.fuchsia: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      );
}
