import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buybliss2/screens/profile/components/profile_assets.dart';
import 'package:buybliss2/screens/sing_in/sing_in_screen.dart';
import 'package:buybliss2/sized_config.dart';
import 'package:buybliss2/state_managements/auth_provider.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final email = Provider.of<AuthProvider>(context).email;

    return SingleChildScrollView(
      child: Column(
        children: [
          ProfilePicture(),
          if (email != null)
            Text(
              email,
              style: TextStyle(
                fontSize: getPropScreenWidth(16),
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color
              ),
            ),
          SizedBox(height: getPropScreenWidth(20)),
          ItemButtonProfile(
            svgIcon: "assets/icons/User Icon.svg",
            title: "My Account",
            press: () {},
          ),
          ItemButtonProfile(
            svgIcon: "assets/icons/Bell.svg",
            title: "Notivication",
            press: () {},
          ),
          ItemButtonProfile(
            svgIcon: "assets/icons/Settings.svg",
            title: "Settings",
            press: () {},
          ),
          ItemButtonProfile(
            svgIcon: "assets/icons/Question mark.svg",
            title: "Help Center",
            press: () {},
          ),
          ItemButtonProfile(
            svgIcon: "assets/icons/Log out.svg",
            title: "Log out",
            press: () {
              Navigator.pushNamedAndRemoveUntil(context,
                  SingInScreen.routesName, (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
