//import 'package:flutter/cupertino.dart';
import 'package:asseignment_flutter/firebase_functions.dart';
import 'package:asseignment_flutter/models/taskModel.dart';
import 'package:asseignment_flutter/todo/bottom_sheet/edit_task_bottom_sheet.dart';
import 'package:asseignment_flutter/todo/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../ebit/edit_screen.dart';

class TaskItem extends StatelessWidget {
  TaskModel model;

  TaskItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<ThemeProvider>(context);
    return Container(
      //padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:
              pro.mode == ThemeMode.light ? Colors.white : Color(0xFF141922)),
      height: 100,
      width: double.infinity,
      child: Slidable(
        startActionPane: ActionPane(
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                FirebaseFunctions.deleteTask(model.id);
              },
              padding: EdgeInsets.zero,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
              label: 'Delete',
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
            SlidableAction(
              onPressed: (context) {
                Navigator.pushNamed(context, EditScreen.routeName,arguments: model);
                // showModalBottomSheet(
                //   isScrollControlled: true,
                //   context: context,
                //   builder: (context) => Padding(
                //     padding: EdgeInsets.only(
                //         bottom: MediaQuery.of(context).viewInsets.bottom),
                //     child: EditTaskBottomSheet(),
                //   ),
                // );
              },
              padding: EdgeInsets.zero,
              label: 'Edit',
              icon: Icons.edit,
              backgroundColor: Colors.blue,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 5,
                decoration: BoxDecoration(
                    color: model.isDone ? Colors.green : Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: TextStyle(
                        fontSize: 22,
                        color: model.isDone ? Colors.green : Colors.blue,
                      ),
                    ),
                    Text(
                      model.description,
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              model.isDone
                  ? Text('Done!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.green))
                  : ElevatedButton(
                      onPressed: () {
                        model.isDone = true;
                        FirebaseFunctions.updateTask(model);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
