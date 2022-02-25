import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/componenets/custom_text_divider.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
                CustomTextBox(
                  controller: _usernameController,
                  label: "İsim",
                  hint: "abcdef",
                ),
                const SizedBox(height: 15),
                CustomTextBox(
                  controller: _passwordController,
                  label: "Şifre",
                  hint: "******",
                  obscureBool: true,
                ),
                const SizedBox(height: 15),
                CustomTextBox(
                  controller: _confirmPasswordController,
                  label: "Şifreyi Onayla",
                  hint: "******",
                  obscureBool: true,
                ),
                const SizedBox(height: 30),
                CustomButton(
                  width: double.infinity,
                  title: "Kayıt Ol",
                  backgroundColor: activeColor,
                  foregroundColor: Colors.white,
                  pressAction: () => signUpPage(context),
                ),
                CustomTextDivider(
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
    int? response = await userController.addNewUser(
        _usernameController.text, _passwordController.text);

    if (response != 200) {
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          titleWidget: CustomText(
            textAlign: TextAlign.center,
            text: response != 5000
                ? _usernameController.text + " zaten kayıtlı"
                : "Bağlantınızı kontrol edin.",
          ),
          bodyWidget: SingleChildScrollView(
            child: Column(
              children: [
                Visibility(
                  visible: response != 5000,
                  child: const CustomText(
                    text:
                        "Girdiğiniz kullanıcı adı başka bir kullanıcı tarafından kullanılmaktadır.\nLütfen tekrar deneyiniz.",
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
