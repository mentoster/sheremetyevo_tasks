import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:sheremetyevo_tasks/Models/coordservice.pbenum.dart';
import 'package:sheremetyevo_tasks/Models/coordservice.pbgrpc.dart';
import 'package:sheremetyevo_tasks/Screens/loginscreen/chooseType.dart';
import 'package:sheremetyevo_tasks/Screens/loginscreen/choose_character.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/main_map.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _page = 0;
  bool _isEngineer = true;
  String _type = "null";
  bool _loadApp = false;
  String titleText = 'Выберите персонажа';

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
    setState(() {
      titleText = _isEngineer ? "Инженер" : "Работник";
    });
    print("login_screen -> _isEngineer : $_isEngineer");
  }

  void _chooseClass(String type, Resuource _reso) {
    initBack(_reso);
    _type = type;
    setState(() {
      titleText = (_isEngineer ? "Инженер" : "Работник") + ", класс $type.";
    });
    print("login_screen -> _type : $_type");
  }

  late CoordsServiceClient _coordsServiceClient;
  void initBack(Resuource _reso) async {
    _coordsServiceClient = CoordsServiceClient(ClientChannel('82.146.61.131',
        port: 8081,
        options: ChannelOptions(credentials: ChannelCredentials.insecure())));
    var id = await _coordsServiceClient.initApp(InitReq(type: _reso));
    print("63. login_screen -> id : $id");
    _coordsServiceClient.writeCoords(WriteCoordsReq(
      id: id.id,
      lat: 64.41415,
      long: 30.51252,
    ));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      ChooseCharacter(_nextPage, _changeCharacter),
      ChooseType(_nextPage, _chooseClass),
      WayMap(_isEngineer),
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
              Expanded(
                child: Text(
                  titleText,
                  overflow: TextOverflow.fade,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
        // backgroundColor: Theme.of(context).accentColor,
        body: pages[_page]);
  }
}
