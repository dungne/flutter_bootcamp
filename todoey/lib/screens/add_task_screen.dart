import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;
  String taskName;

  AddTaskScreen({this.addTaskCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30,
                ),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (name) {
                  taskName = name;
                },
              ),
              FlatButton(
                onPressed: () {
                  var task = Task(name: taskName);
                  addTaskCallback(task);
                },
                color: Colors.lightBlueAccent,
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
