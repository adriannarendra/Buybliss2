import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buybliss2/model/card.dart';
import 'package:buybliss2/screens/carts/components/item_card.dart';
import 'package:buybliss2/sized_config.dart';
import 'package:buybliss2/state_managements/cart_provider.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context,  cartData,  child) =>
        ListView.builder(
          itemCount: cartData.cartitems.length,
          itemBuilder: (context, index) {
            final Cart cart = cartData.cartitems[index];
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getPropScreenWidth(20),
                  vertical: getPropScreenWidth(10)),
              child: Dismissible(
                key: Key(cart.product.id.toString()),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  cartData.removeCartItem(cart);
                },
                background: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: getPropScreenWidth(20)),
                        child: Icon(Icons.delete,
                            color: Colors.white, size: getPropScreenWidth(30)),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                child: ItemCard(
                  cart: cart,
                ),
              ),
            );
          }),
    );
  }
}
