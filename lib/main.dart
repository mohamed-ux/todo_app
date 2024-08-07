//import 'package:asseignment_flutter/CoursesScreen.dart';
//import '../../FLUTTER/all/assignement_flutter/ass_2/lib/androidScreen.dart';

import 'package:asseignment_flutter/todo/homeScreen.dart';
import 'package:flutter/material.dart';

void main(){
runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
  HomeScreen.routeName:(context)=>HomeScreen()
      },
    );
  }
}
