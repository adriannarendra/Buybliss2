import 'package:flutter/material.dart';
import 'package:buybliss2/sized_config.dart';

class BannerDiscount extends StatelessWidget {
  const BannerDiscount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(children: [
        Container(
          width: double.infinity,
          height: getPropScreenWidth(100),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          margin: EdgeInsets.all(getPropScreenWidth(20)),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/cashback.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15)),
        ),
        Container(
          width: double.infinity,
          height: getPropScreenWidth(100),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          margin: EdgeInsets.all(getPropScreenWidth(20)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "A Summer Suprise",
                  style: TextStyle(
                    fontSize: getPropScreenHeight(15),
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Free Apple watch!",
                  style: TextStyle(
                    fontSize: getPropScreenWidth(20),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            )
        ),
      ]),
    );
  }
}
