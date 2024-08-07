import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
          ),
          TextFormField(
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
            style: TextStyle(fontSize: 25),
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(50, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Text(
                'Add Task',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ))
        ],
      ),
    );
  }

  selectedDateFun() async{
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))
    );
    if(chosenDate!=null){
      selectedDate=chosenDate;
      setState(() {

      });
    }
  }
}
