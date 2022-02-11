import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/componenets/custom_text_divider.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/LoginPage/login_page.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class SignUpPage extends StatefulWidget {
  static String routeName = '/SignUpPage';

  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _signUpKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Page"),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width / 4),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Form(
                key: _signUpKey,
                child: Column(
                  children: [
                    usernameTextBox(),
                    passwordTextBox(),
                    confirmPasswordTextBox(),
                    signUpButton(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  CustomButton signUpButton(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButton(
      title: "Sign Up",
      pressAction: () {
        setState(() {
          for (User user in Statics.instance.userController.userList) {
            if (user.name == _usernameController.text) {
              showDialog(
                context: context,
                builder: (_) => CustomAlertDialog(
                  titleWidget: _usernameController.text != ""
                      ? RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: _usernameController.text,
                                  style: kLabelHeader2Style),
                              const TextSpan(
                                  text: " kullanıcı adı kullanılıyor.",
                                  style: kLabelHeader3Style),
                            ],
                          ),
                        )
                      : const Text(
                          "Kullanıcı adı veya şifre boş bırakılamaz.",
                          style: kLabelHeader3Style,
                          textAlign: TextAlign.center,
                        ),
                  bodyWidget: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          "Girdiğiniz kullanıcı adı başka biri tarafından kullanılıyor. Lütfen tekrar deneyiniz.",
                          textAlign: TextAlign.center,
                          style: kLabelHeader3Style,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            title: "Tekrar Dene",
                            pressAction: () {
                              Get.back();
                            }),
                      ],
                    ),
                  ),
                  bodyWidgetWidth: screenSize.width / 3,
                ),
              );
              return;
            }
          }
          var response = Statics.instance.userController
              .postUser(_usernameController.text, _passwordController.text);
          print(response);
          if (_signUpKey.currentState!.validate()) {
            Navigator.pop(context);
          }
        });
      },
    );
  }

  CustomTextBox confirmPasswordTextBox() {
    return CustomTextBox(
      controller: _confirmPasswordController,
      title: "Confirm Password",
      label: "Confirm Password",
      validator: (val) {
        if (val!.isEmpty) {
          return "Cannot Be Blank";
        } else if (val.length < 6) {
          return "Minimum 6 Character";
        } else if (_passwordController.text !=
            _confirmPasswordController.text) {
          return "Password Do Not Match";
        } else {
          return null;
        }
      },
      obscureText: true,
      decorationIcon: const Icon(Icons.lock),
    );
  }

  CustomTextBox passwordTextBox() {
    return CustomTextBox(
      controller: _passwordController,
      title: "Password",
      label: "Password",
      validator: (val) {
        if (val!.isEmpty) {
          return "Cannot Be Blank";
        } else if (val.length < 6) {
          return "Minimum 6 Character";
        } else {
          return null;
        }
      },
      obscureText: true,
      decorationIcon: const Icon(Icons.lock),
    );
  }

  CustomTextBox usernameTextBox() {
    return CustomTextBox(
      controller: _usernameController,
      title: "Username",
      label: "Username",
      validator: (val) {
        if (val!.isEmpty) {
          return "Cannot Be Blank";
        } else {
          return null;
        }
      },
      decorationIcon: const Icon(Icons.person),
    );
  }
}
