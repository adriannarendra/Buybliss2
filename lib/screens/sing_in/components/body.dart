import 'package:flutter/material.dart';
import 'package:buybliss2/constant.dart';
import 'package:buybliss2/screens/sing_in/components/sing_in_form.dart';
import 'package:buybliss2/screens/sing_up/sing_up_screen.dart';
import 'package:buybliss2/sized_config.dart';
import 'package:buybliss2/sosmed_icon.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

bool remember = false;

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final textTheme =
        Theme.of(context).textTheme; 

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getPropScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizedConfig.screenHeight * 0.06,
                ),
                Text(
                  "Welcome back",
                  style: textTheme.headlineSmall?.copyWith(
                    fontSize: getPropScreenWidth(28),
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.dark ?  Colors.white : Colors.black,
                  ),
                ),
                Text(
                  "Sign In With your Email and Password \nor continue with social media",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark ?  Colors.white : Colors.black,
                  ),
                ),
                SizedBox(
                  height: SizedConfig.screenHeight * 0.06,
                ),
                const SingInForm(),
                SizedBox(
                  height: SizedConfig.screenHeight * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SosMed(
                      press: () {},
                      icon: "assets/icons/google-icon.svg",
                    ),
                    SosMed(
                      press: () {},
                      icon: "assets/icons/twitter.svg",
                    ),
                    SosMed(
                      press: () {},
                      icon: "assets/icons/facebook-2.svg",
                    ),
                  ],
                ),
                SizedBox(
                  height: getPropScreenHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark ?  Colors.white : Colors.black,
                      ),

                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignUpScreen.routesName);
                      },
                      child: Text(
                        "Sign Up",
                        style: textTheme.bodyMedium?.copyWith(
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
