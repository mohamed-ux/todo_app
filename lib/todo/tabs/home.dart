import 'package:asseignment_flutter/todo/task_item.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

class TaskTap extends StatelessWidget {
  const TaskTap({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
         children: [
           CalendarTimeline(
             initialDate: DateTime.now(),
             firstDate: DateTime.now().subtract(Duration(days: 365)),
             lastDate: DateTime.now().add(Duration(days: 365)),
             onDateSelected: (date) => print(date),
             leftMargin: 20,
             monthColor: Colors.blueGrey,
             dayColor: Colors.blue,
             activeDayColor: Colors.white,
             activeBackgroundDayColor: Colors.blue,
             selectableDayPredicate: (date) => date.day != 23,
             locale: 'en_ISO',
           ),
           SizedBox(height: 20,),
           Expanded(
             child: ListView.separated(
               separatorBuilder: (context, index) => SizedBox(height: 20,),
                 itemCount: 30,
                 itemBuilder: (context,index){
               return TaskItem();
             }),
           )
         ],
      );

  }
}
