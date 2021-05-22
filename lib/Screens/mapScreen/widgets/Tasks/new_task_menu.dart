import 'package:flutter/material.dart';
import 'package:sheremetyevo_tasks/Models/coordservice.pbgrpc.dart';
import 'package:intl/intl.dart';

class CreateTaskWidget extends StatefulWidget {
  Function newTask;
  final textToField;
  final Function _changeCreateBool;
  CreateTaskWidget(this.newTask, this._changeCreateBool, this.textToField);
  final _controller = TextEditingController();
  void putText() {
    _controller.text = textToField;
  }

  @override
  _CreateTaskWidgetState createState() {
    putText();
    return _CreateTaskWidgetState(newTask, _changeCreateBool, _controller);
  }
}

class _CreateTaskWidgetState extends State<CreateTaskWidget> {
  final TextEditingController _controller;
  final Function newTask;
  bool _isOnWay = false;
  Function _changeCreateBool;
  late Operaions operaion;

  _CreateTaskWidgetState(
      this.newTask, this._changeCreateBool, this._controller);
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.grey;
    }
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Что нужно сделать:"),
            ),
            Container(
              width: 200,
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: _controller,
                  style: TextStyle(fontSize: 14),
                  maxLines: 1,
                  minLines: 1),
            ),
          ],
        ),
        // Row(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.only(left: 8.0),
        //         child: Text("Перекрывает путь?"),
        //       ),
        //       Checkbox(
        //         checkColor: Colors.white,
        //         fillColor: MaterialStateProperty.resolveWith(getColor),
        //         value: _isOnWay,
        //         onChanged: (bool? value) {
        //           setState(() {
        //             _isOnWay = value!;
        //           });
        //         },
        //       ),
        //     ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                _changeCreateBool();
              },
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.blue,
            ),
            Container(
              height: 35,
              padding: EdgeInsets.only(right: 15),
              child: OutlinedButton(
                onPressed: () {
                  _changeCreateBool();
                  newTask(
                      true,
                      DateFormat.Hm().format(DateTime.now()).toString(),
                      _controller.text,
                      "Точка B7");
                },
                child: const Text('Создать'),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  )),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
