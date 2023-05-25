import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/home.dart';
import 'package:flutter_application_1/login/colors.dart';
import 'package:flutter_application_1/login/db/databaseHelper.dart';
import 'package:flutter_application_1/login/input/textField_screen.dart';
import 'package:flutter_application_1/login/model/user.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();
  TextEditingController _addressTextController = TextEditingController();

  Future<void> signUp() async {
    String userName = _userNameTextController.text;
    String email = _emailTextController.text;
    String password = _passwordTextController.text;
    String phone = _phoneTextController.text;
    String address = _addressTextController.text;

    if (userName.isEmpty || email.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please fill in all fields.'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    User newUser = User(
      name: userName,
      email: email,
      password: password,
      address: address,
      phone: phone,
    );

    DatabaseHelper databaseHelper = DatabaseHelper();
    int userId = await databaseHelper.insertUser(newUser);

    if (userId > 0) {
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
            content: Text('Sign up failed. Please try again.'),
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.height,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter UserName", Icons.person, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                    "Enter Email", Icons.person, false, _emailTextController),
                const SizedBox(
                  height: 25,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, false,
                    _passwordTextController),
                const SizedBox(
                  height: 25,
                ),
                reusableTextField(
                    "Enter Phone", Icons.phone, false, _phoneTextController),
                const SizedBox(
                  height: 25,
                ),
                reusableTextField("Enter Address", Icons.location_on, false,
                    _addressTextController),
                ElevatedButton(
                  onPressed: signUp,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
