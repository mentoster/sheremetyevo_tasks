import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/new_task_menu.dart';

class NewTaskMenu extends StatefulWidget {
  Function newTask;
  NewTaskMenu(this.newTask);
  @override
  _NewTaskMenuState createState() => _NewTaskMenuState(newTask);
}

class _NewTaskMenuState extends State<NewTaskMenu> {
  bool _isWantToCreate = false;
  final Function newTask;
  _NewTaskMenuState(this.newTask);
  void changeCreateBool() {
    setState(() {
      _isWantToCreate = !_isWantToCreate;
    });
    print("18. create_new_task -> _isWantToCreate : $_isWantToCreate");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Задания",
          style: TextStyle(fontSize: 25),
        ),
        _isWantToCreate
            ? CreateTaskWidget(newTask, changeCreateBool, "")
            : Container(
                height: 35,
                padding: EdgeInsets.only(right: 15),
                child: OutlinedButton(
                  onPressed: changeCreateBool,
                  child: const Text('Создать задачу'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    )),
                  ),
                ),
              ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(),
        ),
        Text("Существующие задачи")
      ],
    );
  }
}
