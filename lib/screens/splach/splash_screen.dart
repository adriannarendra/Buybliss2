import 'package:flutter/material.dart';
import 'package:buybliss2/screens/splach/components/body.dart';
import 'package:buybliss2/sized_config.dart';

class SplashScreen extends StatelessWidget {
  static String routesName = "/splash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizedConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}