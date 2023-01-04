// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:erp_test/controller/Backend%20Controller/security_user_controller.dart';
import 'package:erp_test/controller/Backend%20Controller/user_controller.dart';
import 'package:erp_test/controller/Frontend%20Controller/authentication_controller.dart';
import 'package:erp_test/screens/AddNewEmployee/add_new_employee.dart';
import 'package:erp_test/screens/AddNewEmployee/components/employee_card.dart';
import 'package:erp_test/screens/LoginPage/login_page.dart';
import 'package:erp_test/screens/SignUp/sign_up.dart';
import 'package:erp_test/screens/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:erp_test/main.dart';
import 'package:get/get.dart';

void main() {
  group("Sign In / Sign Up", () {
    setUpAll(() {
      WidgetsFlutterBinding.ensureInitialized();

      Get.put(AuthenticationController());

      Get.put(SecurityUserController());
    });

    testWidgets(
        'Signin Text field updates text when controller text is changed',
        (WidgetTester tester) async {
      // Setup
      String email = "qwe@qwe.c";
      String password = "qwe123";
      late TextEditingController? emailController;
      late TextEditingController? passwordController;

      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(home: LoginPage()));
      // Simulate loading the login page
      await tester.pumpAndSettle();

      // Find the text form field
      final textField = find.byType(TextFormField);

      final widgetList = tester.widgetList<TextFormField>(textField).toList();
      // Create a TextEditingController
      emailController = widgetList[0].controller;
      passwordController = widgetList[1].controller;

      // Verify that the initial text is displayed
      expect(emailController?.text, equals(''));
      expect(passwordController?.text, equals(''));

      // Set the controller text
      emailController?.text = email;
      passwordController?.text = password;

      // Pump the widget tree to trigger a rebuild
      await tester.pump();

      // Verify that the updated text is displayed
      expect(emailController?.text, equals(email));
      expect(passwordController?.text, equals(password));
    });
    testWidgets(
        'Signup Text field updates text when controller text is changed',
        (WidgetTester tester) async {
      // Setup
      String name = "name";
      String email = "name@qwe.c";
      String password = "qwe123";

      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(home: SignUpPage()));
      await tester.pumpAndSettle();

      // Find the text form field
      final textField = find.byType(TextFormField);

      final widgetList = tester.widgetList<TextFormField>(textField).toList();

      // Create a TextEditingController
      final nameController = widgetList[0].controller;
      final emailController = widgetList[1].controller;
      final passwordController = widgetList[2].controller;
      final repasswordController = widgetList[3].controller;

      // Verify that the initial text is displayed
      expect(nameController?.text, equals(''));
      expect(emailController?.text, equals(''));
      expect(passwordController?.text, equals(''));
      expect(repasswordController?.text, equals(''));

      // Set the controller text
      nameController?.text = name;
      emailController?.text = email;
      passwordController?.text = password;
      repasswordController?.text = password;

      // Pump the widget tree to trigger a rebuild
      await tester.pump();

      // Verify that the updated text is displayed
      expect(nameController?.text, equals(name));
      expect(emailController?.text, equals(email));
      expect(passwordController?.text, equals(password));
      expect(repasswordController?.text, equals(password));
    });
    testWidgets("Login Button Test", (tester) async {
      // Setup
      String email = "qwe@qwe.c";
      String password = "qwe123";
      late TextEditingController? emailController;
      late TextEditingController? passwordController;

      // Build our app and trigger a frame.
      await tester.pumpWidget(App());

      // Simulate loading the login page
      await tester.pumpAndSettle();

      // Find the text form field
      final textField = find.byType(TextFormField);
      final controllers = tester.widgetList<TextFormField>(textField).toList();

      // Create a TextEditingController
      emailController = controllers[0].controller;
      passwordController = controllers[1].controller;

      // Verify that the initial text is displayed
      expect(emailController?.text, equals(''));
      expect(passwordController?.text, equals(''));

      // Set the controller text
      emailController?.text = email;
      passwordController?.text = password;

      // Pump the widget tree to trigger a rebuild
      await tester.pump();

      // Verify that the updated text is displayed
      expect(emailController?.text, equals(email));
      expect(passwordController?.text, equals(password));

      // Simulate navigating to the second page
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ElevatedButton).first);
      await tester.pumpAndSettle(const Duration(seconds: 5));

      expectLater(find.byType(SplashView), findsOneWidget);
    });
  });
  group("Main Page", () {
    testWidgets("Employee Page", (tester) async {
      // Setup
      String email = "qwe@qwe.c";
      String password = "qwe123";

      /* SecurityUser? securityUser = */
      await Get.put(SecurityUserController()).signIn(
        email: email,
        password: password,
      );

      //expectLater(securityUser, isNot(null));
      await Get.put(UserController()).fetchUsers();

      // Simulate loading the login page
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Build our app and trigger a frame.
      await tester.pumpWidget(GetMaterialApp(home: SplashView()));

      // Simulate loading the login page
      await tester.pumpAndSettle();

      expectLater(find.byType(SplashView), findsOneWidget);
    });
    testWidgets("Get Employees", (tester) async {
      // Setup
      String email = "qwe@qwe.c";
      String password = "qwe123";

      final userController = Get.put(UserController());
      /* SecurityUser? securityUser = */
      await Get.put(SecurityUserController()).signIn(
        email: email,
        password: password,
      );
      //expectLater(securityUser, isNot(null));
      await userController.fetchUsers();

      // Simulate loading the login page
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Build our app and trigger a frame.
      await tester.pumpWidget(GetMaterialApp(home: SplashView()));

      // Simulate loading the login page
      await tester.pumpAndSettle();

      final splashView = find.byType(SplashView);

      expectLater(splashView, findsOneWidget);

      final employeeList = find.descendant(
        of: splashView,
        matching: find.byType(EmployeeCard),
      );
      expectLater(employeeList, findsNWidgets(userController.userList.length));
    });
    testWidgets("Employee Detail Page", (tester) async {
      // Setup
      String email = "qwe@qwe.c";
      String password = "qwe123";

      final userController = Get.put(UserController());
      /* SecurityUser? securityUser = */
      await Get.put(SecurityUserController()).signIn(
        email: email,
        password: password,
      );
      //expectLater(securityUser, isNot(null));
      await userController.fetchUsers();

      // Simulate loading the login page
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Build our app and trigger a frame.
      await tester.pumpWidget(GetMaterialApp(home: SplashView()));

      // Simulate loading the login page
      await tester.pumpAndSettle();

      final splashView = find.byType(SplashView);

      expectLater(splashView, findsOneWidget);

      final employeeList = find.descendant(
        of: splashView,
        matching: find.byType(EmployeeCard),
      );
      expectLater(employeeList, findsNWidgets(userController.userList.length));
      final firstEmployee = employeeList.first;

      await tester.pumpAndSettle();
      await tester.tap(firstEmployee);
      await tester.pumpAndSettle();

      final addNewEmployee = find.byType(AddNewEmployee);

      expectLater(addNewEmployee, findsOneWidget);
    });
  });
}
