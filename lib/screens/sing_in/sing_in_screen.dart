import 'package:flutter/material.dart';
import 'package:buybliss2/screens/sing_in/components/body.dart';

class SingInScreen extends StatelessWidget {
  static String routesName = "/sing_in";
  const SingInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : Colors.white,
        title: Text(
          "Sing In",
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
