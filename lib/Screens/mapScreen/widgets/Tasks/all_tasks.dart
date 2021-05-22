import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:sheremetyevo_tasks/Models/coordservice.pbgrpc.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/Task_now_worker.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/create_new_task.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/get_coordinates.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/map_selected_text.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/task.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/tasks_list.dart';

class AllTasks extends StatefulWidget {
  final bool isEngineer;
  SelectedText _selectedText;
  Resuource reso;
  AllTasks(this.isEngineer, this.reso, this._selectedText);
  @override
  _AllTasksState createState() =>
      _AllTasksState(isEngineer, reso, _selectedText);
}

class _AllTasksState extends State<AllTasks> {
  final bool isEngineer;
  SelectedText _selectedText;
  Resuource _reso;
  bool getList = true;
  bool _showAllTasks = false;
  _AllTasksState(this.isEngineer, this._reso, this._selectedText) {
    initBack();
    _collectPosition();
    if (!isEngineer) _voidGetTasks();
  }
  void changeShowAllTasks() {
    _showAllTasks = !_showAllTasks;
    print("30. all_tasks -> _showAllTasks : $_showAllTasks");
  }

  final List<TaskUI> tasks = [
    // TaskUI(0, true, "12:10", "Убрать снег", "Первый участок ИВПП-II", () => {}),
    // TaskUI(1, true, "12:40", "Убрать снег", "Первый участок РД-1", () => {}),
    // TaskUI(
    //     2, true, "14:50", "Очистить дорогу", "Первый участок РД-1", () => {}),
  ];

  void addNewTask(
      bool canSwap, String time, String whatDo, String whatSecondDo) {
    final tsk = TaskUI(
        tasks.length,
        canSwap,
        DateFormat.Hm().format(DateTime.now()).toString(),
        whatDo,
        whatSecondDo,
        deleteTask);
    if (getList) _sendTask(tsk.whatDo);
    setState(() {
      tasks.add(tsk);
    });
  }

  void deleteTask(id) {
    setState(() {
      tasks.removeAt(id);
    });
  }

  late CoordsServiceClient _coordsServiceClient;
  late ID _id;
  GetCoords _getCoords = new GetCoords();
  bool _canUseCoords = false;

  void initBack() async {
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

  late Coords posLast = Coords(long: 0, lat: 0);
  void _collectPosition() async {
    if (_canUseCoords) {
      var pos = await _getCoords.getPosition();
      if (posLast != pos) {
        _sendPosition(pos);
      }
    }
    await Future.delayed(const Duration(seconds: 1), () {});
    _collectPosition();
  }

  void _sendPosition(LocationData pos) {
    posLast.long = pos.longitude!;
    posLast.lat = pos.latitude!;
    print("login_screen -> pos.latitude : ${pos.latitude}");
    print(" login_screen -> pos.altitude : ${pos.longitude}");
    _coordsServiceClient.writeCoords(WriteCoordsReq(
      id: _id.id,
      lat: pos.latitude,
      long: pos.altitude,
    ));
  }

  void _sendTask(String msg) {
    print("93. all_tasks -> msg : $msg");
    _coordsServiceClient.openTask(Task(
        on: Coords(lat: posLast.lat, long: posLast.long), operationName: msg));
  }

  Future<void> _voidGetTasks() async {
    // final str = _coordsServiceClient
    //     .listenCommands(Unit(id: "1suBeuep3uySyjYV746IOYw9rjD"));
    // print("110. all_tasks -> str : $str");
    // str.listen((data) {
    //   print("DataReceived: " + data.toString());
    // }, onDone: () {
    //   print("Task Done");
    // }, onError: (error) {
    //   print("Some Error");
    // });
    print("listen");
    getList = false;
    await for (var feature in _coordsServiceClient
        .listenCommands(Unit(id: "1suAwDZ3WyaZsHbgZmabTB6gxa8"))) {
      addNewTask(true, "", feature.operationName, "");
    }
    getList = true;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          isEngineer ? NewTaskMenu(addNewTask,_selectedText) : TaskNowWorker(),
          TaskList(tasks, deleteTask, true),
          tasks.length > 3
              ? OutlinedButton(
                  onPressed: changeShowAllTasks,
                  child: Container(
                    width: 150,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Все задачи",
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.white),
                      ],
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    )),
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
