import 'package:flutter/material.dart';
import 'package:buybliss2/constant.dart';
import 'package:buybliss2/sized_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key, required this.text, required this.image,
  });

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text("Buybliss", 
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: getPropScreenWidth(36),
          ),
        ),
        Text(text, 
        style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontSize: getPropScreenWidth(14),
          ),
        ),
        Spacer(flex: 2,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(image,
            height: getPropScreenHeight(300),
            width: getPropScreenWidth(300),
          ),
        ),
      ],
    );
  }
}