import 'package:flutter/material.dart';

class CreateTaskWidget extends StatefulWidget {
  Function _changeCreateBool;
  CreateTaskWidget(this._changeCreateBool);
  @override
  _CreateTaskWidgetState createState() =>
      _CreateTaskWidgetState(_changeCreateBool);
}

class _CreateTaskWidgetState extends State<CreateTaskWidget> {
  bool _isOnWay = false;
  Function _changeCreateBool;

  _CreateTaskWidgetState(this._changeCreateBool);
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
                  style: TextStyle(fontSize: 14), maxLines: 1, minLines: 1),
            ),
          ],
        ),
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Перекрывает путь самолёту?"),
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: _isOnWay,
                onChanged: (bool? value) {
                  setState(() {
                    _isOnWay = value!;
                  });
                },
              ),
            ]),
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
                  print('Received click');
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
