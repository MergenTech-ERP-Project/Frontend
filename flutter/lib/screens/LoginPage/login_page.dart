import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/componenets/custom_text_divider.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/utilities/style.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(24),
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
                    "Login",
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
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (val) {},
                      ),
                      const CustomText(
                        text: "Remember Me",
                      ),
                    ],
                  ),
                  CustomText(
                    text: "Forgot Password",
                    color: activeColor,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              CustomButton(
                title: "Login",
                backgroundColor: activeColor,
                foregroundColor: Colors.white,
                pressAction: () => Get.offAllNamed(mainFormPageRoute),
              ),
              CustomTextDivider(
                text: "OR",
              ),
              CustomButton(
                title: "Sign Up",
                backgroundColor: activeColor,
                foregroundColor: Colors.white,
                pressAction: () => Get.offAllNamed(signUpPageRoute),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
