import 'package:asseignment_flutter/firebase_functions.dart';
import 'package:asseignment_flutter/models/taskModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class EditTaskBottomSheet extends StatefulWidget {
  EditTaskBottomSheet({super.key,});

  @override
  State<EditTaskBottomSheet> createState() => _EditTaskBottomSheetState();
}

class _EditTaskBottomSheetState extends State<EditTaskBottomSheet> {
  DateTime selectedDate = DateTime.now();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Edit Task',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25,
                color: pro.mode==ThemeMode.light?Colors.black:Colors.white),
          ),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              label: Text(
                'Title',
                style: TextStyle(fontSize: 20),
              ),
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
              label: Text(
                'Description',
                style: TextStyle(fontSize: 20),
              ),
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Select Time',
            style: TextStyle(fontSize: 25,
                color: pro.mode==ThemeMode.light?Colors.black:Colors.white),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              selectedDateFun();
            },
            child: Text(
              selectedDate.toString().substring(0, 10),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                TaskModel model = TaskModel(
                    userId: FirebaseAuth.instance.currentUser!.uid,
                    title: titleController.text,
                    description: descriptionController.text,
                    date: DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch);
                FirebaseFunctions.updateTask(model);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(50, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Text(
                'Save Changes',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ))
        ],
      ),
    );
  }

  selectedDateFun() async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }
}
