import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/utilities/constans.dart';

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
        foregroundColor: kSecondaryColor,
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
    return CustomButton(
      title: "Sign Up",
      pressAction: () {
        setState(() {
          for (User user in Statics.instance.userController.userList) {
            if (user.name == _usernameController.text) {
              showDialog(
                  context: context,
                  builder: (_) =>
                      const SimpleDialog(title: Text("Same Username exists!")));
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
