import 'package:flutter/material.dart';
import 'package:buybliss2/screens/home/component/banner_discount.dart';
import 'package:buybliss2/screens/home/component/header_home_part.dart';
import 'package:buybliss2/screens/home/component/item_category.dart';
import 'package:buybliss2/screens/home/component/popular_item.dart';
import 'package:buybliss2/screens/home/component/special_offer_card.dart';
import 'package:buybliss2/sized_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(child: 
      Column(
        children: [
          SizedBox(
            height: getPropScreenHeight(10),
          ),
          headerHomePart(),
          SizedBox(
            height: getPropScreenHeight(10),
          ),
          BannerDiscount(),
          ItemCategoris(),
          SpecialOffers(),
          SizedBox(height: getPropScreenHeight(20),),
          PopularItem(),
          SizedBox(
            height: getPropScreenHeight(20),
          )
        ],
      ),
      ),
    )
    ;
  }
}


