import 'package:sheremetyevo_tasks/Models/coordservice.pb.dart';

class SelectedText {
  String text;
  Coords coords = Coords(long: 0, lat: 0);
  SelectedText(this.text);
}
