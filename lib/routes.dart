import 'package:flutter/material.dart';
import 'package:buybliss2/model/product_data.dart';
import 'package:buybliss2/screens/carts/carts_screen.dart';
import 'package:buybliss2/screens/complit/complit_screen.dart';
import 'package:buybliss2/screens/details/detail_screen.dart';
import 'package:buybliss2/screens/favourite/favourite_screen.dart';
import 'package:buybliss2/screens/forgot/forgot_screen.dart';
import 'package:buybliss2/screens/home/home.dart';
import 'package:buybliss2/screens/login_succses/succses_screen.dart';
import 'package:buybliss2/screens/otp/otp_screen.dart';
import 'package:buybliss2/screens/profile/profile.dart';
import 'package:buybliss2/screens/sing_in/sing_in_screen.dart';
import 'package:buybliss2/screens/sing_up/sing_up_screen.dart';
import 'package:buybliss2/screens/splach/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routesName: (context) => SplashScreen(),
  SingInScreen.routesName:  (context) => SingInScreen(),
  ForgotScreen.routesName: (context) => ForgotScreen(),
  SuccsesScreen.routesName: (context) =>  SuccsesScreen(),
  SignUpScreen.routesName:  (context) => SignUpScreen(),
  ComplitScreen.routesName: (context) =>  ComplitScreen(),
  OtpScreen.routesName: (context) => OtpScreen(),
  HomeScreen.routesName: (context) => HomeScreen(),
  DetailScreen.routesName:  (context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    return DetailScreen(product: product);
  },
  ProfileScreen.routesName: (context)  => ProfileScreen(),
  CartsScreen.routesName: (context) => CartsScreen(),
  FavouriteScreen.routesName: (context) => FavouriteScreen(),
};