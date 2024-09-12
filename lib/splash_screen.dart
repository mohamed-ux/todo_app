import 'package:asseignment_flutter/todo/homeScreen.dart';
import 'package:asseignment_flutter/todo/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<ThemeProvider>(context);
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Scaffold(
      body: pro.mode == ThemeMode.light
          ? Image.asset(
              'assets/images/splash_background.png',
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            )
          : Image.asset(
              'assets/images/dark_splash.png',
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
    );
  }
}
