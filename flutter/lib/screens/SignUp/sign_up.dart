import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:vtys_kalite/controller/user_controller.dart';
import 'package:vtys_kalite/screens/LoginPage/login_page.dart';
import 'package:vtys_kalite/utilities/constans.dart';

class SignUpPage extends StatefulWidget {
  static String routeName = '/SignUpPage';

  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _signUpKey = GlobalKey<FormState>();
  final TextEditingController _passCntrl = TextEditingController();
  final TextEditingController _confirmPassCntrl = TextEditingController();
  final TextEditingController _usernameCntrl = TextEditingController();
  final UserController userController = Get.put(UserController());

  bool passwordObscured = true;
  bool confirmPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var ratio = MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Page"),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: screenSize.width < 600/ratio ? screenSize.width * 0.5 : 500/ratio,
            height: screenSize.height < 800/ratio ? screenSize.height * 0.5 : 700/ratio,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Form(
                key: _signUpKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
          setState(() {
            var response = userController.postUser(_usernameCntrl.text, _passCntrl.text);
            print(response);
            if (_signUpKey.currentState!.validate()) {
              Navigator.pushNamed(context, LoginPage.routeName);
            }
          });
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
        } else if (val.length < 6) {
          return "Minimum 6 Character";
        } else if (_passCntrl.text != _confirmPassCntrl.text) {
          return "Password Do Not Match";
        } else {
          return null;
        }
      },
      obscureText: confirmPasswordObscured,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        labelText: "Password",
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple),
          borderRadius: BorderRadius.circular(20),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              confirmPasswordObscured =! confirmPasswordObscured;
            });
          },
          icon: confirmPasswordObscured ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
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
        } else if (val.length < 6) {
          return "Minimum 6 Character";
        } else {
          return null;
        }
      },
      obscureText: passwordObscured,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        labelText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              passwordObscured =! passwordObscured;
            });
          },
          icon: passwordObscured ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
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
        labelText: "Username",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
