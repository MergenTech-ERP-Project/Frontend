import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vtys_kalite/screens/LoginPage/login_page.dart';
import 'package:vtys_kalite/utilities/constans.dart';

class SignUpPage extends StatefulWidget {
  static String routeName = '/SignUpPage';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _signUpKey = GlobalKey<FormState>();
  final TextEditingController _passCntrl = TextEditingController();
  final TextEditingController _confirmPassCntrl = TextEditingController();
  final TextEditingController _usernameCntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Page"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 100.0, bottom: 100.0, right: 250.0, left: 250.0),
          child: Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Form(
                key: _signUpKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Username", style: kLabelStyle),
                    const SizedBox(height: 10),
                    _buildUsernameSignUp(),
                    const SizedBox(height: 20),
                    const Text("Password", style: kLabelStyle),
                    const SizedBox(height: 10),
                    _buildPasswordSignUp(),
                    const SizedBox(height: 20),
                    const Text("Password", style: kLabelStyle),
                    const SizedBox(height: 10),
                    _buildConfirmPasswordSignUp(),
                    const SizedBox(height: 20),
                    _buildSignUpBtn(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _buildSignUpBtn(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          if (_signUpKey.currentState!.validate()) {
            Navigator.pushNamed(context, LoginPage.routeName);
          }
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ))),
        child: Text("Sign Up"),
      ),
    );
  }

  TextFormField _buildConfirmPasswordSignUp() {
    return TextFormField(
      controller: _confirmPassCntrl,
      validator: (val) {
        if (val!.isEmpty) {
          return "Cannot Be Blank";
        } else if (val.length <= 6) {
          return "Minimum 6 Character";
        } else if (_passCntrl != _confirmPassCntrl) {
          return "Password Do Not Match";
        } else {
          return null;
        }
      },
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        hintText: "Password",
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  TextFormField _buildPasswordSignUp() {
    return TextFormField(
      controller: _passCntrl,
      validator: (val) {
        if (val!.isEmpty) {
          return "Cannot Be Blank";
        } else if (val.length <= 6) {
          return "Minimum 6 Character";
        } else {
          return null;
        }
      },
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  TextFormField _buildUsernameSignUp() {
    return TextFormField(
      controller: _usernameCntrl,
      validator: (val) {
        if (val!.isEmpty) {
          return "Cannot Be Blank";
        }
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        hintText: "Username",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
