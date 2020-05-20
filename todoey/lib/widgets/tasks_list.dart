import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {

  final List<Task> list;
  final Function checkboxCallback;

  TasksList({this.list, this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return TaskTile(
            title: list[index].name,
            isChecked: list[index].isDone,
            checkboxCallback: (checkboxValue) {
              checkboxCallback(index);
            },
          );
        }
    );
  }
}
