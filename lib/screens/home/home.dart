import 'package:flutter/material.dart';
import 'package:buybliss2/components/costume_navigator.dart';
import 'package:buybliss2/enums.dart';
import 'package:buybliss2/screens/home/component/body.dart';

class HomeScreen extends StatelessWidget {
  static String routesName = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavigationBar(
        menu: MenuState.home,
      ),
    );
  }
}
