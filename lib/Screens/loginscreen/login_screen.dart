import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:location/location.dart';
import 'package:sheremetyevo_tasks/Models/coordservice.pbenum.dart';
import 'package:sheremetyevo_tasks/Models/coordservice.pbgrpc.dart';
import 'package:sheremetyevo_tasks/Screens/loginscreen/chooseType.dart';
import 'package:sheremetyevo_tasks/Screens/loginscreen/choose_character.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/main_map.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/getCoordinates.dart';

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
    _type = type;
    setState(() {
      titleText = (_isEngineer ? "Инженер" : "Работник") + ", класс $type.";
    });
    initBack(_reso);
    _collectPosition();
    print("login_screen -> _type : $_type");
  }

  late CoordsServiceClient _coordsServiceClient;
  late ID _id;
  GetCoords _getCoords = new GetCoords();
  bool _canUseCoords = false;

  void initBack(Resuource _reso) async {
    _coordsServiceClient = CoordsServiceClient(ClientChannel('82.146.61.131',
        port: 8081,
        options: ChannelOptions(credentials: ChannelCredentials.insecure())));
    _id = await _coordsServiceClient.initApp(InitReq(type: _reso));
    print("login_screen -> id : $_id");
    _canUseCoords = await _getCoords.canUse();
    print("login_screen -> _canUseCoords : $_canUseCoords");
    if (_canUseCoords) {
      _sendPosition(await _getCoords.getPosition());
    }
  }

  late LocationData posLast;
  void _collectPosition() async {
    if (_page == 2 && _canUseCoords) {
      var pos = await _getCoords.getPosition();
      if (posLast != pos) {
        _sendPosition(pos);
      }
    }
    await Future.delayed(const Duration(seconds: 1), () {});
    _collectPosition();
  }

  void _sendPosition(LocationData pos) {
    posLast = pos;
    print("login_screen -> pos.latitude : ${pos.latitude}");
    print(" login_screen -> pos.altitude : ${pos.altitude}");
    _coordsServiceClient.writeCoords(WriteCoordsReq(
      id: _id.id,
      lat: pos.latitude,
      long: pos.altitude,
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
