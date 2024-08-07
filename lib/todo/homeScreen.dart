
import 'package:asseignment_flutter/todo/tabs/home.dart';
import 'package:asseignment_flutter/todo/tabs/setting.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet/add_task_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'todo';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'To Do App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(

        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
            context: context, builder: (context) => Padding(
            padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddTaskBottomSheet(),
          ),);
        },
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side:BorderSide(width: 3,color: Colors.white)
        ),
        child: Icon(Icons.add,color: Colors.white,),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
         notchMargin: 8,
        shape:CircularNotchedRectangle() ,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: selectedTab,
          onTap: (val) {
            selectedTab = val;
            setState(() {});
          },
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
          ],
        ),
      ),
      body: tabs[selectedTab],
    );
  }
  List<Widget> tabs=[
    TaskTap(),
    Setting()
  ];
}
