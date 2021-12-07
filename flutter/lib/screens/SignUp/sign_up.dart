import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/constans.dart';

class SignUpPage extends StatefulWidget {
  static String routeName = '/SignUpPage';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _usernameController = TextEditingController();

  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Page"),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(200.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter a Username",
                        style: kLabelStyle,
                      ),
                      const SizedBox(height: 20),
                      _buildUsernameSignUp(),
                      const SizedBox(height: 20),
                      const Text(
                        "Enter a password",
                        style: kLabelStyle,
                      ),
                      const SizedBox(height: 20),
                      _buildPasswordSignUp(),
                      const SizedBox(height: 20),
                      const Text(
                        "Enter password one more",
                        style: kLabelStyle,
                      ),
                      const SizedBox(height: 20),
                      _buildConfirmPasswordSignUp(),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 20,
                        ),
                        onPressed: () {},
                        child: const Text("Register"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _buildConfirmPasswordSignUp() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 60,
      child: TextFormField(
        obscureText: true,
        controller: _confirmPasswordController,
        validator: (val) {
          if (val!.length >= 6) {
            return null;
          } else if (_confirmPasswordController != _passwordController) {
          } else {
            return "You entered a password of less than 6 digits";
          }
        },
        keyboardType: TextInputType.visiblePassword,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Comfortaa',
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 20),
          prefixIcon: Icon(
            Icons.password_outlined,
            color: Colors.black,
          ),
          hintText: 'Enter your Password',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Container _buildPasswordSignUp() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 60,
      child: TextFormField(
        obscureText: true,
        controller: _passwordController,
        validator: (val) {
          if (val!.length >= 6) {
            return null;
          } else {
            return "You entered a password of less than 6 digits";
          }
        },
        keyboardType: TextInputType.visiblePassword,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Comfortaa',
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 20),
          prefixIcon: Icon(
            Icons.password,
            color: Colors.black,
          ),
          hintText: 'Enter your Password',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Container _buildUsernameSignUp() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 60,
      child: Form(
        key: _usernameForm,
        child: TextFormField(
          controller: _usernameController,
          validator: (val) {
            if (val.toString() == "") {
              return null;
            } else {
              return "Username cannot be blank";
            }
          },
          keyboardType: TextInputType.name,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Comfortaa',
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 20),
            prefixIcon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            hintText: 'Enter your Username',
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    );
  }
}
