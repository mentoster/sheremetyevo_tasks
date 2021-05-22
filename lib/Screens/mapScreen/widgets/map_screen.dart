import 'package:flutter/material.dart';
import 'package:sheremetyevo_tasks/Models/coordservice.pbgrpc.dart';
import 'package:sheremetyevo_tasks/Screens/mapScreen/widgets/Tasks/map_selected_text.dart';

class MapScreen extends StatefulWidget {
  SelectedText _selectedText;
  MapScreen(this._selectedText);
  @override
  _MapScreenState createState() => _MapScreenState(_selectedText);
}

class _MapScreenState extends State<MapScreen> {
  SelectedText _selectedText;
  double scale = 0.1;
  _MapScreenState(this._selectedText);
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      maxScale: 15,
      minScale: 1,
      child: Container(
        child: Center(
          child: Stack(children: [
            Image(image: AssetImage("assets/images/shema1opt.jpg")),
            Positioned(
                top: 126,
                left: 40,
                child: Transform.scale(
                    scale: 0.09,
                    child: WayButton(Coords(lat: 4, long: 5), "Очистить РД-B",
                        _selectedText))),
            Positioned(
                top: 137,
                left: 40,
                child: Transform.scale(
                    scale: 0.09,
                    child: WayButton(Coords(lat: 4, long: 5),
                        "ИВПП 1, первая часть", _selectedText))),
            Positioned(
                top: 153,
                left: 40,
                child: Transform.scale(
                    scale: 0.09,
                    child: WayButton(Coords(lat: 4, long: 5),
                        "ИВПП 2,первая часть", _selectedText))),
            Positioned(
                top: 140,
                left: 250,
                child: Transform.scale(
                    scale: 0.3,
                    child: Icon(Icons.person_pin, color: Colors.red[900]))),
          ]),
        ),
      ),
    );
  }
}

class WayButton extends StatelessWidget {
  SelectedText _selectedText;
  Coords _coords;
  String _name;
  WayButton(this._coords, this._name, this._selectedText);
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return const Color(0x3D4400FF);
    }
    return const Color(0xF1E20202);
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ButtonStyle(
        shadowColor: MaterialStateProperty.resolveWith(getColor),
        backgroundColor: MaterialStateProperty.resolveWith(getColor));
    return ElevatedButton(
      style: style,
      onPressed: () {
        _selectedText.text = _name;
        _selectedText.coords = _coords;
      },
      child: Container(
        width: 425,
        height: 1,
      ),
    );
  }
}
