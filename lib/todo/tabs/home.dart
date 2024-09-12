import 'package:asseignment_flutter/firebase_functions.dart';
import 'package:asseignment_flutter/todo/task_item.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

class TaskTap extends StatefulWidget {
  TaskTap({super.key});

  @override
  State<TaskTap> createState() => _TaskTapState();
}

class _TaskTapState extends State<TaskTap> {
  DateTime selectedDate= DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: selectedDate,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date){
            selectedDate=date;
            setState(() {

            });
          },
          leftMargin: 20,
          monthColor: Colors.blueGrey,
          dayColor: Colors.blue,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Colors.blue,
          selectableDayPredicate: (date) => date.day != 1,
          locale: 'en_ISO',
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
            child: StreamBuilder(
          stream: FirebaseFunctions.getTask(selectedDate),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text('Something is Wrong');
            }
            var tasks = snapshot.data?.docs.map((doc) => doc.data()).toList();
            if (tasks?.isEmpty ?? true) {
              return Text('There is no Tasks');
            }
            return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                itemCount: tasks!.length,
                itemBuilder: (context, index) {
                  return TaskItem(model: tasks[index]);
                });
          },
        ))
      ],
    );
  }
}
