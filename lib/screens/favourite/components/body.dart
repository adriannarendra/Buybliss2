import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:buybliss2/constant.dart';
import 'package:buybliss2/model/card.dart';
import 'package:buybliss2/model/product_data.dart';
import 'package:buybliss2/sized_config.dart';
import 'package:buybliss2/state_managements/cart_provider.dart';
import 'package:buybliss2/state_managements/favourite_provider.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(
      builder: (context, favourite, child) {
        return ListView.builder(
          itemCount: favourite.favouriteProducts.length,
          itemBuilder: (context, index) {
            final Product product = favourite.favouriteProducts[index];
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getPropScreenWidth(20),
                vertical: getPropScreenWidth(10),
              ),
              child: Slidable(
                key: Key(product.id.toString()),
                endActionPane: ActionPane(motion: ScrollMotion(), children: [
                  SlidableAction(
                      onPressed: (context) {
                        Provider.of<CartProvider>(context, listen: false)
                            .addCartItem(Cart(product: product, numOfItem: 1));
                        favourite.toggleFavouriteStatus(product.id);
                      },
                      icon: Icons.shopping_cart,
                      label: 'Cart',
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
                      padding: EdgeInsets.all(getPropScreenWidth(20)),
                      backgroundColor: kPrimaryColor),
                  SlidableAction(
                      onPressed: (context) {
                        favourite.toggleFavouriteStatus(product.id);
                      },
                      icon: Icons.delete,
                      label: 'Delete',
                      padding: EdgeInsets.all(getPropScreenWidth(20)),
                      backgroundColor: Colors.red),
                ]),
                child: Row(
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
                            product.images[0],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: getPropScreenWidth(20)),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                        SizedBox(height: getPropScreenWidth(10)),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "\$${product.price} ",
                                style: TextStyle(
                                  fontSize: getPropScreenWidth(18),
                                  fontWeight: FontWeight.w600,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
