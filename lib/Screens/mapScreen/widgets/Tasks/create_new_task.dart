import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/map_selected_text.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/new_task_menu.dart';

class NewTaskMenu extends StatefulWidget {
  Function newTask;
  SelectedText _selectedText;
  NewTaskMenu(this.newTask, this._selectedText);
  @override
  _NewTaskMenuState createState() => _NewTaskMenuState(newTask, _selectedText);
}

class _NewTaskMenuState extends State<NewTaskMenu> {
  SelectedText _selectedText;
  bool _isWantToCreate = false;
  final Function newTask;
  _NewTaskMenuState(this.newTask, this._selectedText);
  void changeCreateBool() {
    setState(() {
      print(
          "21. create_new_task -> _selectedText.text : ${_selectedText.text}");
      _isWantToCreate = !_isWantToCreate;
      if (!_isWantToCreate) _selectedText.text = '';
    });
    print("18. create_new_task -> _isWantToCreate : $_isWantToCreate");
  }

  void update() async {
    setState(() {
      _selectedText.text = _selectedText.text;
    });
    await Future.delayed(const Duration(milliseconds: 300), () {});
    update();
  }

  @override
  Widget build(BuildContext context) {
    update();
    return Column(
      children: [
        Text(
          "Задания",
          style: TextStyle(fontSize: 25),
        ),
        (_isWantToCreate || _selectedText.text.length > 0)
            ? CreateTaskWidget(newTask, changeCreateBool, _selectedText.text)
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
