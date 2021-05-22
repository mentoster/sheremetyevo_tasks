import 'dart:ui';

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
                TypeButton(
                  "Человек",
                  _chooseClass,
                  ImageIcon(
                    AssetImage("assets/images/icons/Inzh.png"),
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                TypeButton(
                  "грузчик/самосвал",
                  _chooseClass,
                  ImageIcon(
                    AssetImage("assets/images/icons/Gruzovik.png"),
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                TypeButton(
                  "экскаватор",
                  _chooseClass,
                  ImageIcon(
                    AssetImage("assets/images/icons/Eskaavator.png"),
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                TypeButton(
                  "роторный погрузчик",
                  _chooseClass,
                  ImageIcon(
                    AssetImage("assets/images/icons/rotorny_pogruzchik.png"),
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                TypeButton(
                  "плужно-щеточная машина",
                  _chooseClass,
                  ImageIcon(
                    AssetImage(
                        "assets/images/icons/pluzhno-schetochnaya_mashina.png"),
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                TypeButton(
                  "плужно-щеточная машина с реагентом.",
                  _chooseClass,
                  ImageIcon(
                    AssetImage(
                        "assets/images/icons/pluzhno-schetochnaya_mashina.png"),
                    color: Color(0xFFFFFFFF),
                  ),
                ),
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
  final ImageIcon icon;
  // final Image
  TypeButton(this.buttonText, this.changeClass, this.icon);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: double.infinity,
        height: 40,
        child: OutlinedButton(
          onPressed: () => changeClass(buttonText),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Text(
                buttonText,
                overflow: TextOverflow.fade,
                softWrap: true,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
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
