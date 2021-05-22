import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:location/location.dart';
import 'package:sheremetyevo_tasks/Models/coordservice.pbgrpc.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/Task_now_worker.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/create_new_task.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/getCoordinates.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/task.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/tasks_list.dart';

class AllTasks extends StatefulWidget {
  final bool isEngineer;
  Resuource reso;
  AllTasks(this.isEngineer, this.reso);
  @override
  _AllTasksState createState() => _AllTasksState(isEngineer, reso);
}

class _AllTasksState extends State<AllTasks> {
  final bool isEngineer;
  Resuource _reso;
  _AllTasksState(this.isEngineer, this._reso) {
    initBack();
    _collectPosition();
  }

  final List<TaskUI> tasks = [
    TaskUI(0, true, "12:10", "Убрать снег", "Первый участок ИВПП-II", () => {}),
    TaskUI(1, true, "12:40", "Убрать снег", "Первый участок РД-1", () => {}),
    TaskUI(
        2, true, "14:50", "Очистить дорогу", "Первый участок РД-1", () => {}),
  ];
  void addNewTask(
      bool canSwap, String time, String whatDo, String whatSecondDo) {
    final tsk =
        TaskUI(tasks.length, canSwap, time, whatDo, whatSecondDo, deleteTask);

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

  late LocationData posLast;
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
    return Center(
      child: Column(
        children: [
          isEngineer ? NewTaskMenu(addNewTask) : TaskNowWorker(),
          TaskList(tasks, deleteTask)
        ],
      ),
    );
  }
}
