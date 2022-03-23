// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/componenets/custom_text_divider.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _cellPhoneController = TextEditingController();

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
                      text: signUpPageDisplayName,
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
                      signUpPage(context);
                    }
                  },
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        CustomTextBox(
                          controller: _usernameController,
                          label: "İsim",
                          hint: "abcdef",
                          validator: (val) {
                            if (val!.trim() == "") {
                              return "İsmini kontrol et!";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
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
                        const SizedBox(height: 15),
                        CustomTextBox(
                          controller: _confirmPasswordController,
                          label: "Şifreyi Onayla",
                          hint: "******",
                          obscureBool: true,
                          validator: (val) {
                            if (val!.trim() == "") {
                              return "Şifreyi Onayla'yı kontrol et!";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        CustomTextBox(
                          maxLength: 11,
                          controller: _cellPhoneController,
                          label: "Telefon Numarası",
                          hint: "0 (555) 555 55 55",
                          validator: (val) {
                            if (!val!.isPhoneNumber) {
                              return "Telefon Numarayı kontrol et";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  width: double.infinity,
                  title: "Kayıt Ol",
                  backgroundColor: activeColor,
                  foregroundColor: Colors.white,
                  pressAction: () => signUpPage(context),
                ),
                const CustomTextDivider(
                  text: "ya da",
                ),
                CustomButton(
                  width: double.infinity,
                  title: "İptal",
                  backgroundColor: activeColor,
                  foregroundColor: Colors.white,
                  pressAction: () => Get.offAllNamed(loginPageRoute),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  signUpPage(context) async {
    if (!(_formkey.currentState!.validate())) return;

    int? response = await userController.addNewUser(
      newUser: User(
        name: _usernameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        title: "management",
        cellphone: _cellPhoneController.text,
      ),
      tcNo: (int.tryParse(userDetailController.userDetailList.isNotEmpty
                  ? userDetailController.userDetailList.last.tcno
                  : "0") ??
              0 + 1)
          .toString(),
    );

    if (response < 200 || response >= 300) {
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          titleWidget: CustomText(
            textAlign: TextAlign.center,
            text: response != 5000
                ? _emailController.text + " zaten kayıtlı"
                : "Bağlantınızı kontrol edin.",
          ),
          bodyWidget: SingleChildScrollView(
            child: Column(
              children: [
                Visibility(
                  visible: response != 5000,
                  child: const CustomText(
                    text:
                        "Girdiğiniz email başka bir kullanıcı tarafından kullanılmaktadır.\nLütfen tekrar deneyiniz.",
                    textAlign: TextAlign.center,
                  ),
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
    Get.offAllNamed(loginPageRoute);
  }
}
