import 'package:flutter/material.dart';
import 'package:vtys_kalite/screens/SignUp/sign_up.dart';
import 'package:vtys_kalite/utilities/constans.dart';

class LoginPage extends StatefulWidget {
  static String routeName = '/LoginPage';

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(200.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Login Page",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Comfortaa',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30),
                    _buildUsername(),
                    SizedBox(height: 30),
                    _buildPassword(),
                    SizedBox(height: 30),
                    _buildForgotPassword(),
                    //Buraya belki RememberMeCheckbox eklenebilir.
                    _buildLogInBtn(),
                    _buildSignUpBtn()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _buildSignUpBtn extends StatelessWidget {
  const _buildSignUpBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("Don't have an Account?"),
        ),
        Container(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, SignUpPage.routeName);
            },
            child: const Text(
              'SIGN UP',
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1.5,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Comfortaa'),
            ),
          ),
        )
      ],
    );
  }
}

class _buildLogInBtn extends StatelessWidget {
  const _buildLogInBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            print("içi boş");
          },
          child: const Text(
            'LOGIN',
            style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.5,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Comfortaa'),
          ),
        ),
      ),
    );
  }
}

class _buildForgotPassword extends StatelessWidget {
  const _buildForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          print("içi boş");
        },
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
              color: Colors.black, fontFamily: 'Comfortaa', fontSize: 16),
        ),
      ),
    );
  }
}

class _buildPassword extends StatelessWidget {
  const _buildPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: const TextField(
            obscureText: true,
            style: TextStyle(color: Colors.black, fontFamily: 'Comfortaa'),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 20),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}

class _buildUsername extends StatelessWidget {
  const _buildUsername({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Username',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Comfortaa',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 20),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              hintText: 'Enter your Username',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
