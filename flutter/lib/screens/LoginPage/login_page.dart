import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:vtys_kalite/controller/user_controller.dart';
import 'package:vtys_kalite/screens/ActivityForm/activity_form.dart';
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
  final TextEditingController _usernameCntrl = TextEditingController();
  final TextEditingController _passCntrl = TextEditingController();
  final UserController userController = Get.put(UserController());

  bool passwordObscured = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var ratio = MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: screenSize.width < 600/ratio ? screenSize.width * 0.5 : 500/ratio,
            height: screenSize.height < 800/ratio ? screenSize.height * 0.5 : 700/ratio,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Form(
                    key: _loginKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Username", style: kLabelStyle),
                        const SizedBox(height: 10),
                        _buildUsername(),
                        const SizedBox(height: 20),
                        const Text("Password", style: kLabelStyle),
                        const SizedBox(height: 10),
                        _buildPassword(),
                        const SizedBox(height: 20),
                        _buildLoginBtn(context),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const Text("Don't have an Account?"),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpPage.routeName);
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      child: Text("Sign Up"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _buildLoginBtn(BuildContext context) {
    return Container(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() async {
                              int id = await userController.fetchUser(_usernameCntrl.text, _passCntrl.text);
                              if(id == -1) {
                                return;
                              } else {
                                if (_loginKey.currentState!.validate()) {
                                  Navigator.pushNamed(
                                      context, ActivityFormPage.routeName, arguments: id);
                                }
                              }
                            });
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: Text("Login"),
                        ),
                      );
  }

  TextFormField _buildPassword() {
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
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Password",
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

  TextFormField _buildUsername() {
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
