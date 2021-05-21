import 'package:flutter/material.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/new_tasks.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/tasks.dart';

class BottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Tasks(),
          NewTasks(),
        ],
      ),
    );
  }
}
