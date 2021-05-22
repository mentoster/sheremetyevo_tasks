import 'package:flutter/material.dart';
import 'package:sheremetyevo_tasks/Models/coordservice.pbenum.dart';

class ChooseType extends StatelessWidget {
  final Function nextPage;
  final Function changeClass;
  ChooseType(this.nextPage, this.changeClass);
  void _chooseClass(String type) {
    nextPage();

    Resuource res = Resuource.HUMAN;
    switch (type) {
      case "Человек":
        res = Resuource.HUMAN;
        break;
      case "грузчик/самосвал":
        res = Resuource.TRUCK;
        break;
      case "экскаватор":
        res = Resuource.ECAVATOR;
        break;
      case "роторный погрузчик":
        res = Resuource.ROTARY_LOADER;
        break;
      case "плужно-щеточная машина":
        res = Resuource.PLOW_AND_BRUSH_MACHINE;
        break;
      case "плужно-щеточная машина с реагентом.":
        res = Resuource.PLOW_AND_BRUSH_MACHINE_REG;
        break;
      default:
        res = Resuource.HUMAN;
        break;
    }
    changeClass(type, res);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Center(
            child: Text("Мой\nкласс...",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 108, color: Colors.black)),
          ),
          Divider(),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TypeButton("Человек", _chooseClass),
                TypeButton("грузчик/самосвал", _chooseClass),
                TypeButton("экскаватор", _chooseClass),
                TypeButton("роторный погрузчик", _chooseClass),
                TypeButton("плужно-щеточная машина", _chooseClass),
                TypeButton("плужно-щеточная машина с реагентом.", _chooseClass),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TypeButton extends StatelessWidget {
  final String buttonText;
  final Function changeClass;
  TypeButton(this.buttonText, this.changeClass);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 40,
        child: OutlinedButton(
          onPressed: () => changeClass(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            )),
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
        ),
      ),
    );
  }
}
