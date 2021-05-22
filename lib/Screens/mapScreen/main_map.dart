import 'package:flutter/material.dart';
import 'package:sheremetyevo_tasks/Models/coordservice.pbenum.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/all_tasks.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/map_selected_text.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/map_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'dart:io' show Platform;

class WayMap extends StatelessWidget {
  SelectedText _selectedText = SelectedText('');
  bool _isEngineer;
  Resuource reso;
  WayMap(this._isEngineer, this.reso);
  final BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );
  Widget body() {
    if (Platform.isAndroid || Platform.isWindows || Platform.isIOS)
      return MapScreen(_selectedText);
    else
      return Center(child: Text("На этом устройстве \nотсутсвуют датчики gps"));
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      parallaxEnabled: true,
      backdropEnabled: true,
      panel: Center(
        child: AllTasks(_isEngineer, reso,_selectedText),
      ),
      body: body(),
      borderRadius: radius,
    );
  }
}
