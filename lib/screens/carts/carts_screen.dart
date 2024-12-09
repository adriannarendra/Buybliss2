import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buybliss2/screens/carts/components/cart_bottom_bar.dart';
import 'package:buybliss2/sized_config.dart';
import 'package:buybliss2/state_managements/cart_provider.dart';

import 'components/body.dart';

class CartsScreen extends StatelessWidget {
  static String routesName = "/carts";
  const CartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Body(),
      bottomNavigationBar: CartBottomBar(),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? const Color.fromARGB(255,20,18,24)
                  : Colors.white,
      leading: IconButton(
        color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios)),
      title: Column(
        children: [
          Text("Your Cart", style: Theme.of(context).textTheme.bodyLarge),
          Consumer<CartProvider>(
            builder: (context, cart, child) => Text(
              "${cart.cartitems.length} items",
              style: TextStyle(
                  fontSize: getPropScreenWidth(12),
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
