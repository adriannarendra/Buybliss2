import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:buybliss2/components/my_button.dart';
import 'package:buybliss2/constant.dart';
import 'package:buybliss2/sized_config.dart';
import 'package:buybliss2/state_managements/cart_provider.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getPropScreenWidth(30),
        vertical: getPropScreenHeight(15),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color.fromARGB(255,33,31,37)
              : Colors.white,
          // (33,31,37,255)
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -15),
                blurRadius: 20,
                color: Theme.of(context).brightness == Brightness.dark
              ? const Color.fromARGB(255,33,31,37).withOpacity(0.30)
              : Color(0xffdadada).withOpacity(0.30)
              ),
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: getPropScreenWidth(40),
                width: getPropScreenWidth(40),
                decoration: BoxDecoration(
                    color: Color(0xfff5f6f9),
                    borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset(
                  "assets/icons/receipt.svg",
                  color: kPrimaryColor,
                ),
              ),
              Spacer(),
              Text(
                "Add Voucher Code",
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
          SizedBox(
            height: getPropScreenWidth(20),
          ),
          Consumer<CartProvider>(
            builder: (context, cart, child) => Row(
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "Total\n",
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      )),
                  TextSpan(
                      text: "\$${cart.totalPrice}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ))
                ])),
                Spacer(),
                SizedBox(
                    width: getPropScreenWidth(190),
                    child: MyButton(
                        text: "Check Out",
                        press: () {
                          cart.clearCart();
                        }))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
