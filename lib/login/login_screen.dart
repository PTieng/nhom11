import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/home.dart';
import 'package:flutter_application_1/login/colors.dart';
import 'package:flutter_application_1/login/db/databaseHelper.dart';
import 'package:flutter_application_1/login/input/textField_screen.dart';
import 'package:flutter_application_1/login/model/user.dart';
import 'package:flutter_application_1/login/signup_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  Future<void> login() async {
    String email = _emailTextController.text;
    String password = _passwordTextController.text;

    if (email.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all fields.'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    DatabaseHelper databaseHelper = DatabaseHelper();
    User? user = await databaseHelper.getUser(email, password);

    if (user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Invalid email or password.'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 45,
              ),
              reusableTextField(
                "Enter Email",
                Icons.person,
                false,
                _emailTextController,
              ),
              const SizedBox(
                height: 30,
              ),
              reusableTextField(
                "Enter Password",
                Icons.lock,
                true,
                _passwordTextController,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: login,
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              signUpOption(context),
            ],
          ),
        ),
      ),
    );
  }
}

Row signUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Don't have an account? ",
        style: TextStyle(color: Colors.white70),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUpPage()));
        },
        child: const Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ],
  );
}
