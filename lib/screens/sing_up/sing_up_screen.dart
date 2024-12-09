import 'package:flutter/material.dart';
import 'package:buybliss2/screens/sing_up/component/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routesName = "/sign_up";
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark ?  Colors.black : Colors.
        white,
        title: Text(
          "Sign Up",
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
