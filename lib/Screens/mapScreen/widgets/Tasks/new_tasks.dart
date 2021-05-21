import 'package:flutter/material.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/new_task.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NewTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: NewTask(),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Отказаться',
          color: Colors.red,
          icon: Icons.archive,
          onTap: () => Text('Archive'),
        ),
        IconSlideAction(
          caption: 'Принять',
          color: Colors.green,
          icon: Icons.share,
          onTap: () => Text('Share'),
        ),
      ],
    );
    // Column(
    //   children: [
    //     Text("Следующие задачи:"),
    //     NewTask(),

    //   ],
    // );
  }
}
