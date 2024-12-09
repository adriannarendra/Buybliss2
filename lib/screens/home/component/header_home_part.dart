import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buybliss2/screens/carts/carts_screen.dart';
import 'package:buybliss2/screens/home/component/icon_with_trigger.dart';
import 'package:buybliss2/screens/home/component/search.dart';
import 'package:buybliss2/sized_config.dart';
import 'package:buybliss2/state_managements/cart_provider.dart';

class headerHomePart extends StatelessWidget {
  const headerHomePart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, CartsScreen.routesName);
            },
            child: Consumer<CartProvider>(
              builder: ( context,  cartData,  child) => iconWithTigger(
                svgIcon: 'assets/icons/Cart Icon.svg',
                tigger: cartData.cartitems.length.toString(),
              ),
            ),
          ),
          iconWithTigger(
            svgIcon: 'assets/icons/Bell.svg',
          ),
        ],
      ),
    );
  }
}
