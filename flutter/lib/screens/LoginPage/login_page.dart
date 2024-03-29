// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_checkbox.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/componenets/custom_text_divider.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/user_controller.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool isCheckboxTrue = true;
  final _formkey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 800),
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(
                  image: AssetImage("assets/icon/mergentech_minimal.png"),
                  width: 250,
                ),
                Row(
                  children: [
                    const CustomText(
                      text: loginPageDisplayName,
                      size: 30,
                      weight: FontWeight.w500,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                RawKeyboardListener(
                  focusNode: FocusNode(),
                  onKey: (e) {
                    if (e.isKeyPressed(LogicalKeyboardKey.enter)) {
                      loginButton(context);
                    }
                  },
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        CustomTextBox(
                          controller: _emailController,
                          label: "Email",
                          hint: "abcdef@gmail.com",
                          validator: (val) {
                            if (!val!.isValidEmail()) {
                              return "Email'i kontrol et!";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        CustomTextBox(
                          controller: _passwordController,
                          label: "Şifre",
                          hint: "******",
                          obscureBool: true,
                          validator: (val) {
                            if (val!.trim() == "") {
                              return "Şifre'yi kontrol et!";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                _ActionBar(isCheckboxTrue: isCheckboxTrue),
                const SizedBox(height: 15),
                CustomButton(
                  width: double.infinity,
                  title: "Giriş Yap",
                  backgroundColor: activeColor,
                  foregroundColor: Colors.white,
                  pressAction: () => loginButton(context),
                ),
                const CustomTextDivider(
                  text: "ya da",
                ),
                CustomButton(
                  width: double.infinity,
                  title: "Kayıt Ol",
                  backgroundColor: activeColor,
                  foregroundColor: Colors.white,
                  pressAction: () => Get.offAllNamed(signUpPageRoute),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  loginButton(context) async {
    if (!(_formkey.currentState!.validate())) return;

    securityUser = (await securityUserController.signIn(
      email: _emailController.text,
      password: _passwordController.text,
    ))!;

    print("Security User : " + securityUser.toJson().toString());

    if (securityUser.id == -1) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => CustomAlertDialog(
          titleWidget: _emailController.text != ""
              ? CustomText(
                  textAlign: TextAlign.center,
                  text: _emailController.text + " için yanlış email veya şifre",
                )
              : const CustomText(
                  textAlign: TextAlign.center,
                  text: "Email veya şifre boş bırakılamaz.",
                ),
          bodyWidget: SingleChildScrollView(
            child: Column(
              children: [
                const CustomText(
                  text:
                      "Girdiğiniz email veya şifre yanlış. Lütfen tekrar deneyiniz.",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  width: double.infinity,
                  title: "Tekrar Dene",
                  pressAction: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
          bodyWidgetWidth: MediaQuery.of(context).size.width / 3,
        ),
      );
      return;
    }

    Get.put(UserController());
    User? _user = await userController.fetchUserByName(securityUser.username);
    print("User : " + (_user?.toJson().toString() ?? "Null"));
    if (_user == null) return;
    if (isCheckboxTrue) {
      authenticationController.login(user: _user, securityUser: securityUser);
    } else {
      user = _user;
    }
    Get.offAllNamed(rootRoute);
  }
}

class _ActionBar extends StatefulWidget {
  _ActionBar({
    Key? key,
    this.isCheckboxTrue = false,
  }) : super(key: key);
  bool isCheckboxTrue;

  @override
  State<_ActionBar> createState() => _ActionBarState();
}

class _ActionBarState extends State<_ActionBar> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isLargeScreen(context)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCheckbox(
                value: widget.isCheckboxTrue,
                text: "Hatırla",
                onChanged: () {
                  setState(() {
                    widget.isCheckboxTrue = !widget.isCheckboxTrue;
                  });
                },
              ),
              CustomText(
                text: "Şifremi Unuttum",
                color: activeColor,
              ),
            ],
          )
        : Column(
            children: [
              CustomCheckbox(
                value: widget.isCheckboxTrue,
                text: "Hatırla",
                onChanged: () {
                  setState(() {
                    widget.isCheckboxTrue = !widget.isCheckboxTrue;
                  });
                },
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: CustomText(
                      text: "Şifremi Unuttum",
                      color: activeColor,
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  )
                ],
              ),
            ],
          );
  }
}
