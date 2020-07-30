import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text('Item 1'),
      value: false,
      onChanged: (bool value) {},
    );
  }
}
