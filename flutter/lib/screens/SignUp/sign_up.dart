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
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 12),
                      child: CustomText(
                        text: "Mergen Tech",
                        color: darkColor,
                        size: 24,
                        weight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      "Sign Up",
                      style: GoogleFonts.roboto(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                CustomTextBox(
                  controller: _usernameController,
                  label: "Name",
                  hint: "abcdef",
                ),
                const SizedBox(height: 15),
                CustomTextBox(
                  controller: _passwordController,
                  label: "Password",
                  hint: "******",
                  obscureBool: true,
                ),
                const SizedBox(height: 15),
                CustomTextBox(
                  controller: _confirmPasswordController,
                  label: "Confirm Password",
                  hint: "******",
                  obscureBool: true,
                ),
                const SizedBox(height: 30),
                CustomButton(
                  width: double.infinity,
                  title: "Sign Up",
                  backgroundColor: activeColor,
                  foregroundColor: Colors.white,
                  pressAction: () => signUpPage(context),
                ),
                CustomTextDivider(
                  text: "OR",
                ),
                CustomButton(
                  width: double.infinity,
                  title: "Cancel",
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
            text: response == 1000
                ? _usernameController.text + " Zaten Kayıtlı"
                : "Bağlantınızı kontrol edin.",
          ),
          bodyWidget: SingleChildScrollView(
            child: Column(
              children: [
                Visibility(
                  visible: response == 1000,
                  child: const CustomText(
                    text:
                        "Girdiğiniz kullanıcı adı başka bir kullanıcı tarafından"
                        "kullanılmaktadır.\n Lütfen tekrar deneyiniz.",
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
