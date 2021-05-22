import 'package:flutter/material.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/map_screen.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/opened_card.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'dart:io' show Platform;

class WayMap extends StatelessWidget {
  bool _isEngineer;


  WayMap(this._isEngineer);
  final BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );
  Widget body() {
    if (Platform.isAndroid || Platform.isWindows || Platform.isIOS)
      return MapScreen();
    else
      return Center(child: Text("На этом устройстве \nотсутсвуют датчики gps"));
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      parallaxEnabled: true,
      backdropEnabled: true,
      panel: Center(
        child:  BottomMenu(_isEngineer),
      ),
      body: body(),
      borderRadius: radius,
    );
  }
}
