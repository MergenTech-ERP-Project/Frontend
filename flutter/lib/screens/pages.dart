import 'package:get/get.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/screens/LoginPage/login_page.dart';
import 'package:vtys_kalite/screens/SignUp/sign_up.dart';
import 'package:vtys_kalite/screens/splash_view.dart';

List<GetPage> pageList = [
  GetPage(
    name: loginPageRoute,
    page: () => LoginPage(),
  ),
  GetPage(
    name: signUpPageRoute,
    page: () => SignUpPage(),
  ),
  GetPage(
    name: rootRoute,
    page: () => SplashView(),
  ),
];
