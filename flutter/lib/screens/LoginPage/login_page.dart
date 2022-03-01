import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_checkbox.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/componenets/custom_text_divider.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool isCheckboxTrue = true;
  final _formkey = GlobalKey<FormState>();

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
                            return "";
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
                            return "";
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const _ActionBar(),
                const SizedBox(height: 15),
                CustomButton(
                  width: double.infinity,
                  title: "Giriş Yap",
                  backgroundColor: activeColor,
                  foregroundColor: Colors.white,
                  pressAction: () => loginButton(context),
                ),
                CustomTextDivider(
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

    int id = await userController.fetchUserByEmailAndPassword(
        _emailController.text, _passwordController.text);
    if (id == -1) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => CustomAlertDialog(
          titleWidget: _emailController.text != ""
              ? CustomText(
                  textAlign: TextAlign.center,
                  text: _emailController.text +
                      " için yanlış kullanıcı adı veya şifre",
                )
              : const CustomText(
                  textAlign: TextAlign.center,
                  text: "Kullanıcı adı veya şifre boş bırakılamaz.",
                ),
          bodyWidget: SingleChildScrollView(
            child: Column(
              children: [
                const CustomText(
                  text:
                      "Girdiğiniz şifre veya kullanıcı adı yanlış. Lütfen tekrar deneyiniz.",
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
    if (isCheckboxTrue) {
      authenticationController.login(_emailController.text);
    } else {
      user.name = _emailController.text;
    }
    Get.offAllNamed(rootRoute);
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isLargeScreen(context)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCheckbox(
                text: "Hatırla",
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
                text: "Hatırla",
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
