import 'package:flutter/material.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/task.dart';

class TaskList extends StatelessWidget {
  ScrollController scrollController = ScrollController();
  final List<TaskUI> _tasks;
  final Function deleteTask;
  final bool showTop;
  TaskList(this._tasks, this.deleteTask, this.showTop);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: showTop
                ? (_tasks.length < 5 ? _tasks.length : 5)
                : _tasks.length,
            itemBuilder: (bctx, index) {
              return _tasks[index];
            }));
  }
}
