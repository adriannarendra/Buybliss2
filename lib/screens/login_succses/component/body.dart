import 'package:flutter/material.dart';
import 'package:buybliss2/components/my_button.dart';
import 'package:buybliss2/screens/home/home.dart';
import 'package:buybliss2/sized_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: SizedConfig.screenHeight * 0.04,
          ),
          Image.asset("assets/images/success.png"),
          SizedBox(
            height: SizedConfig.screenHeight * 0.08,
          ),
          Text("Login Success", style: TextStyle(
            fontSize: getPropScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Theme.of(context).brightness == Brightness.dark ?  Colors.white : Colors.black,
          )),
          Spacer(),
          SizedBox(
            width: SizedConfig.screenWidth * 0.6,
            child: MyButton(text: "Back To Home", press: () {
              Navigator.pushNamed(context, HomeScreen.routesName);
            }),
          ),
          Spacer()
        ],
      ),
    );
  }
}