import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buybliss2/components/my_button.dart';
import 'package:buybliss2/components/rounded_icon_button.dart';
import 'package:buybliss2/model/card.dart';
import 'package:buybliss2/model/product_data.dart';
import 'package:buybliss2/screens/details/components/color_picker.dart';
import 'package:buybliss2/screens/details/components/detail_description.dart';
import 'package:buybliss2/screens/details/components/img_detail.dart';
import 'package:buybliss2/screens/details/components/rouded_container.dart';
import 'package:buybliss2/sized_config.dart';
import 'package:buybliss2/state_managements/cart_provider.dart';
import 'package:buybliss2/state_managements/favourite_provider.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.product});

  final Product product;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentSelectionColor = 0;
  int totalSelected = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ImageDetail(product: widget.product),
            RoundedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DetailDescription(product: widget.product),
                  SizedBox(height: getPropScreenWidth(40)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getPropScreenWidth(20)),
                    child: Row(children: [
                      ...List.generate(widget.product.colors.length, (index) {
                        final Color color = widget.product.colors[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              currentSelectionColor = index;
                            });
                          },
                          child: ItemColorDot(
                            color: color,
                            isSelected: index == currentSelectionColor,
                          ),
                        );
                      }),
                      Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: RoundedIconBtn(
                                icon: Icons.remove,
                                press: totalSelected > 1
                                    ? () {
                                        setState(() {
                                          totalSelected--;
                                        });
                                      }
                                    : null),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "$totalSelected",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            child: RoundedIconBtn(
                                icon: Icons.add,
                                press: () {
                                  setState(() {
                                    totalSelected++;
                                  });
                                }),
                          ),
                        ],
                      )
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getPropScreenWidth(70),
                        vertical: getPropScreenWidth(20)),
                    child: MyButton(
                        text: "Add To Cart",
                        press: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addCartItem(Cart(
                                  product: widget.product,
                                  numOfItem: totalSelected));
                          if (widget.product.isFavourite) {
                            Provider.of<FavouriteProvider>(context,
                                    listen: false)
                                .toggleFavouriteStatus(widget.product.id);
                          }
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
