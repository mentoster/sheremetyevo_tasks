import 'package:flutter/material.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/map_screen.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/opened_card.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class WayMap extends StatelessWidget {
  bool _isEngineer;
  WayMap(this._isEngineer);
  final BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        parallaxEnabled: true,
        backdropEnabled: true,
        panel: Center(
          child: _isEngineer ? EngineerBottomMenu() : WorkerBottomMenu(),
        ),
        body: Text("Карта"), //MapScreen(),
        borderRadius: radius,
      ),
    );
  }
}
