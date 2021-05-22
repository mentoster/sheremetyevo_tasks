import 'package:flutter/material.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/task.dart';

class TaskList extends StatefulWidget {
  List<Task> _task;
  TaskList(this._task);
  @override
  _TaskListState createState() => _TaskListState(_task);
}

class _TaskListState extends State<TaskList> {
  List<Task> _task;
  _TaskListState(this._task);
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
