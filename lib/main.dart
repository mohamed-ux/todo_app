import 'package:asseignment_flutter/ebit/edit_screen.dart';
import 'package:asseignment_flutter/login/login_screen.dart';
import 'package:asseignment_flutter/login/signup_screen.dart';
import 'package:asseignment_flutter/splash_screen.dart';
import 'package:asseignment_flutter/todo/providers/login_provider.dart';
import 'package:asseignment_flutter/todo/providers/theme_provider.dart';
import 'package:asseignment_flutter/todo/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:asseignment_flutter/todo/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.enableNetwork();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var pro = Provider.of<LoginProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: provider.mode,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      initialRoute: pro.firebaseUser!=null?HomeScreen.routeName:LoginScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignupScreen.routeName: (context) => SignupScreen(),
        EditScreen.routeName: (context) => EditScreen(),
      },
    );
  }
}
