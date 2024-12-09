import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:buybliss2/routes.dart';
import 'package:buybliss2/screens/splach/splash_screen.dart';
import 'package:buybliss2/state_managements/auth_provider.dart';
import 'package:buybliss2/state_managements/cart_provider.dart';
import 'package:buybliss2/state_managements/favourite_provider.dart';
import 'package:buybliss2/state_managements/search_provide.dart';
import 'package:buybliss2/state_managements/theme_provider.dart';
import 'package:buybliss2/theme.dart';
import 'package:device_preview/device_preview.dart';  // Import the device preview package

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(
    DevicePreview(  // Wrap your app with DevicePreview
      enabled: true,  // Enable it only in debug mode
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => AuthProvider()),
          ChangeNotifierProvider(create: (context) => CartProvider()),
          ChangeNotifierProvider(create: (context) => FavouriteProvider()),
          ChangeNotifierProvider(create: (context) => SearchProvider()),
        ],
        child: MainApp(isLoggedIn: isLoggedIn),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required bool isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData(theme.isDarkMode),
        title: 'Buybliss',
        initialRoute: SplashScreen.routesName,
        routes: routes,
        builder: DevicePreview.appBuilder,  // Wrap the app builder to support device preview
      ),
    );
  }
}
