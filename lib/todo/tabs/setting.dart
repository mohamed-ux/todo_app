import 'package:asseignment_flutter/todo/bottom_sheet/language_bottom_sheet.dart';
import 'package:asseignment_flutter/todo/bottom_sheet/theme_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Language',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
                color: pro.mode==ThemeMode.dark?Colors.white:Color(0xFF141922)),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: (){
              showModalBottomSheet(context: context, builder: (context)=>
              LanguageBottomSheet());
            },
            child: Center(
              child: Container(
                padding: EdgeInsets.all(15),
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                    color: pro.mode==ThemeMode.light?Colors.white:Color(0xFF141922),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 2,color: Colors.blue)),
                child: Text('English',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                    color: pro.mode==ThemeMode.light?Colors.black:Colors.blue)),),
              ),
            ),

          SizedBox(height: 50,),
          Text(
            'Theme',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
                color: pro.mode==ThemeMode.dark?Colors.white:Color(0xFF141922)),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: (){
              showModalBottomSheet(context: context, builder: (context)=>
              ThemeBottomSheet()
              );
            },
            child: Center(
              child: Container(
                padding: EdgeInsets.all(15),
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                    color: pro.mode==ThemeMode.light?Colors.white:Color(0xFF141922),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 2,color: Colors.blue)),
                child: Text(pro.mode==ThemeMode.light?'Light':'Dark'

                  ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                      color: pro.mode==ThemeMode.light?Colors.black:Colors.blue),),
              ),
            ),
          ),
          SizedBox(height: 50,),
    ],
    ));
  }
}
