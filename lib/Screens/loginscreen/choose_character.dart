import 'package:flutter/material.dart';
import 'package:sheremetyevo_tasks/Models/coordservice.pbenum.dart';
import 'package:sheremetyevo_tasks/Screens/loginscreen/getCharacher.dart';
import 'package:sheremetyevo_tasks/Screens/loginscreen/getType.dart';

class ChooseCharacter extends StatefulWidget {
  final Function nextPage;
  final Function changeType;
  final Function(bool) changeCharacter;
  ChooseCharacter(this.nextPage, this.changeType, this.changeCharacter);
  @override
  _ChooseCharacterState createState() =>
      _ChooseCharacterState(nextPage, changeType, changeCharacter);
}

class _ChooseCharacterState extends State<ChooseCharacter> {
  final Function nextPage;
  final Function changeType;
  final Function(bool) changeCharacter;
  _ChooseCharacterState(this.nextPage, this.changeType, this.changeCharacter);
  int characterIndex = 0;
  int typeIndex = 0;
  void _chooseType(String type) {
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

    changeType(type, res);
  }

  Column getTypeIcon(path, name) {
    return Column(
      children: [
        ImageIcon(
          AssetImage("assets/images/icons/$path.png"),
          color: Colors.blue,
          size: 100,
        ),
        Text(
          name,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<GetType> types = [
      GetType("Inzh", "Человек"),
      GetType("Gruzovik", "грузчик/самосвал"),
      GetType("Eskaavator", "экскаватор"),
      GetType("rotorny_pogruzchik", "роторный погрузчик"),
      GetType("pluzhno-schetochnaya_mashina", "плужно-щеточная машина"),
      GetType("pluzhno-schetochnaya_mashina",
          "плужно-щеточная машина\nс реагентом."),
    ];
    List<GetCharacter> characters = [
      GetCharacter("Инженер", Colors.blue),
      GetCharacter("Работник", Colors.red)
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          "Выбор\nперсонажа",
          style: TextStyle(
            fontSize: 28,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        )),
        Divider(),
        Center(
            child: Text(
          "Расса",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  if (characterIndex < characters.length - 1)
                    setState(() {
                      characterIndex++;
                    });
                  else
                    setState(() {
                      characterIndex = 0;
                    });
                },
                icon: Icon(Icons.arrow_back_ios_outlined)),
            characters[characterIndex],
            IconButton(
                onPressed: () {
                  if (characterIndex > 0)
                    setState(() {
                      characterIndex--;
                    });
                  else
                    setState(() {
                      characterIndex = characters.length - 1;
                    });
                },
                icon: Icon(Icons.arrow_forward_ios_outlined)),
          ],
        ),
        Center(
            child: Text(
          "Тип",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  if (typeIndex > 0)
                    setState(() {
                      typeIndex--;
                    });
                  else
                    setState(() {
                      typeIndex = types.length - 1;
                    });
                  print("166. choose_character -> typeIndex : $typeIndex");
                },
                icon: Icon(Icons.arrow_back_ios_outlined)),
            types[typeIndex],
            IconButton(
                onPressed: () {
                  if (typeIndex < types.length - 1)
                    setState(() {
                      typeIndex++;
                    });
                  else
                    setState(() {
                      typeIndex = 0;
                    });
                  print("166. choose_character -> typeIndex : $typeIndex");
                },
                icon: Icon(Icons.arrow_forward_ios_outlined)),
          ],
        ),
        Divider(),
        OutlinedButton(
          onPressed: () {
            changeCharacter(
                characters[characterIndex].name == "Инженер" ? true : false);
            _chooseType(types[typeIndex].name);
          },
          child: Container(
            width: 150,
            height: 50,
            child: Center(
              child: Text(
                "Начать",
                overflow: TextOverflow.fade,
                softWrap: true,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            )),
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
        ),
      ],
    );
  }
}
