import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buybliss2/components/item_popular.dart';
import 'package:buybliss2/model/product_data.dart';
import 'package:buybliss2/screens/details/detail_screen.dart';
import 'package:buybliss2/screens/home/component/special_offer_card.dart';
import 'package:buybliss2/sized_config.dart';
import 'package:buybliss2/state_managements/favourite_provider.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
          child: const SectionTitle(
            title: 'Popular Products',
          ),
        ),
        SizedBox(
          height: getPropScreenHeight(20),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: getPropScreenWidth(250),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Consumer<FavouriteProvider>(
                builder: (context, products, child) => Row(
                    children:
                        List.generate(products.listProducts.length, (index) {
                  final Product product = products.listProducts[index];
                  return ItemPoularProduct(
                    product: product,
                    press: () {
                      Navigator.pushNamed(context, DetailScreen.routesName,
                          arguments: product);
                    },
                  );
                })),
              ),
            ),
          ),
        )
      ],
    );
  }
}
