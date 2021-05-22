import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  List<Widget> _task;
  TaskList(this._task);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _task.length,
            itemBuilder: (bctx, index) {
              return _task[index];
            }));
  }
}
