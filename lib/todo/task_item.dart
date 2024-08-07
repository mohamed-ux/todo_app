//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blue[50]
      ),
      height: 100,
      width: double.infinity,
      child: Slidable(

        startActionPane: ActionPane(motion: DrawerMotion(),
          children: [
            SlidableAction(onPressed: (context){},
              padding: EdgeInsets.zero,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
              label:'Delete',
              icon: Icons.delete,
              backgroundColor: Colors.red,),
            SlidableAction(onPressed: (context){},
              padding: EdgeInsets.zero,
              label:'Edit',
              icon: Icons.edit,
              backgroundColor: Colors.blue,),
          ],),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 5,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius:BorderRadius.circular(10)
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Task Title',style: TextStyle(fontSize: 22,color: Colors.blue),),
                    Text('Task Describtion',style: TextStyle(fontSize: 15,color: Colors.grey),),

                  ],
                ),
              ),
              ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue
                  ),
                  child: Icon(Icons.done,color: Colors.white,))
            ],
          ),
        ),
      ),
    );
  }
}
