import 'package:flutter/material.dart';
import 'package:buybliss2/screens/login_succses/component/body.dart';

class SuccsesScreen extends StatelessWidget {
  static String routesName = '/login_succses';
  const SuccsesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color.fromARGB(255,20,18,24)
            : Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Login Success',
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
