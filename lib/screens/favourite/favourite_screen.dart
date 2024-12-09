import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buybliss2/sized_config.dart';
import 'package:buybliss2/state_managements/favourite_provider.dart';

import 'components/body.dart';

class FavouriteScreen extends StatelessWidget {
  static String routesName = "/fav";
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Body(),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? const Color.fromARGB(255, 20, 18, 24)
          : Colors.white,
      title: Column(
        // crossAxisAlignment: ,
        children: [
          Text("Your Favourites", style: Theme.of(context).textTheme.bodyLarge),
          Consumer<FavouriteProvider>(
            builder: (context, favourite, child) => Text(
              "${favourite.favouriteProducts.length} items",
              style: TextStyle(
                fontSize: getPropScreenWidth(12),
                fontWeight: FontWeight.w600,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
                // color:
                //     themeProvider.isDarkMode ? Colors.white : Colors.black
              ),
            ),
          )
        ],
      ),
    );
  }
}
