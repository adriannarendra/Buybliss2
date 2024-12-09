import 'package:flutter/material.dart';
import 'package:buybliss2/constant.dart';
import 'package:buybliss2/model/card.dart';
import 'package:buybliss2/sized_config.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.cart,
  });

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: getPropScreenWidth(88),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kSecoundaryColor.withOpacity(0.2),
              ),
              child: Image.asset(
                cart.product.images[0],
              ),
            ),
          ),
        ),
        SizedBox(
          width: getPropScreenWidth(20),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.title,
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            SizedBox(
              width: getPropScreenWidth(10),
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: "\$ ${cart.product.price} ",
                    style: TextStyle(
                      fontSize: getPropScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    )),
                TextSpan(
                    text: "x${cart.numOfItem}",
                    style: TextStyle(
                      fontSize: getPropScreenWidth(15),
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ))
              ]),
            ),
          ],
        ),
      ],
    );
  }
}
