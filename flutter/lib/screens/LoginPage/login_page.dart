import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/componenets/custom_text_divider.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/screens/ActivityForm/activity_form_page.dart';
import 'package:vtys_kalite/screens/SignUp/sign_up.dart';
import 'package:vtys_kalite/utilities/constans.dart';

class LoginPage extends StatefulWidget {
  static String routeName = '/LoginPage';

  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        backgroundColor: kPrimaryColor,
        foregroundColor: kSecondaryColor,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width / 4),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Form(
                key: _loginKey,
                child: Column(
                  children: [
                    usernameTextBox(),
                    passwordTextBox(),
                    loginButton(context),
                    CustomTextDivider(text: "OR", thickness: 2),
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

  CustomButton loginButton(BuildContext context) {
    return CustomButton(
      title: "Login",
      pressAction: () {
        setState(() async {
          int id = await Statics.instance.userController
              .fetchUser(_usernameController.text, _passwordController.text);
          if (id == -1) {
            return;
          } else {
            if (_loginKey.currentState!.validate()) {
              Statics.instance.userId = id;
              Navigator.pushNamed(context, ActivityFormPage.routeName);
            }
          }
        });
      },
    );
  }

  CustomButton signUpButton(BuildContext context) {
    return CustomButton(
        title: "Sign Up",
        pressAction: () {
          Navigator.pushNamed(context, SignUpPage.routeName);
        });
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
