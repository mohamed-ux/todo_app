import 'package:asseignment_flutter/firebase_functions.dart';
import 'package:asseignment_flutter/todo/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/taskModel.dart';
import '../todo/providers/theme_provider.dart';

class EditScreen extends StatefulWidget {
  static const String routeName = 'edit';

  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as TaskModel;
    var pro = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Task',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25,
              color: pro.mode == ThemeMode.light ? Colors.black : Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          8.0,
        ),
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                initialValue: model.title,
                onChanged: (val) {
                  model.title = val;
                },
                decoration: InputDecoration(
                  label: Text(
                    'Title',
                    style: TextStyle(fontSize: 20),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                initialValue: model.description,
                onChanged: (val) {
                  model.description = val;
                },
                decoration: InputDecoration(
                  label: Text(
                    'Description',
                    style: TextStyle(fontSize: 20),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Select Time',
                style: TextStyle(
                    fontSize: 25,
                    color: pro.mode == ThemeMode.light
                        ? Colors.black
                        : Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () async{
                  DateTime? newDate = await selectedDateFun();
                  if(newDate != null){
                    model.date = newDate.microsecondsSinceEpoch;
                    setState(() {

                    });
                  }
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
        ),
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
    return chosenDate;
  }
}
