import 'package:flutter/material.dart';
import 'package:sheremetyevo_tasks/Screens/loginscreen/chooseType.dart';
import 'package:sheremetyevo_tasks/Screens/loginscreen/choose_character.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/way_map.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _page = 0;

  bool _isEngineer = true;

  String _type = "null";

  bool _loadApp = false;

  void _backPage() {
    if (_page > 0)
      setState(() {
        --_page;
      });
    print("login_screen -> _page : $_page");
  }

  void _nextPage() {
    if (_page < 2)
      setState(() {
        ++_page;
      });
    else
      _loadApp = !_loadApp;
    print("login_screen -> _page : $_page");
  }

  void _changeCharacter(bool isEng) {
    _isEngineer = isEng;
    print("login_screen -> _isEngineer : $_isEngineer");
  }

  void _chooseClass(String type) {
    _type = type;
    print("login_screen -> _type : $_type");
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      ChooseCharacter(_nextPage, _changeCharacter),
      ChooseType(_nextPage, _chooseClass),
      WayMap(),
    ];
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    _backPage();
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              const Text('Выберите персонажа'),
            ],
          ),
        ),
        // backgroundColor: Theme.of(context).accentColor,
        body: pages[_page]);
  }
}
