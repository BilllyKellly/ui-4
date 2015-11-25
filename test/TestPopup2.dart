//Sample Code: Test Log

import 'package:rikulo_ui/view.dart';

class Popup extends View {
  Popup() {
    classes.add("v-popup");

    on.activate.listen((event) {
      if (event.shallClose(this))
        remove();
    });
  }
  String get className => "Popup";
}

void main() {
  ScrollView view = new ScrollView();
  view.classes.add("v-dialog");
  view.profile.text = "width: 80%; height: 80%; location: center center";

  View color = new View();
  color.style.backgroundColor = "blue";
  color.left = color.top = 100;
  color.width = 2000;
  color.height = 600;
  view.addChild(color);

  Button btn = new Button("Show Popup");
  btn.profile.anchorView = color;
  btn.profile.location = "north start";
  view.addChild(btn);

  View popup = new Popup()
    ..width = 300
    ..height = 200
    ..style.backgroundColor = "yellow";
  popup.profile..anchorView = btn
    ..location = "south start";

  btn.on.click.listen((event) {
    popup.addToDocument(layout: true);
  });

  Button btn2 = new Button("Create Popup 1");
  btn2.profile.anchorView = btn;
  btn2.profile.location = "east start";
  btn2.on.click.listen((event) {
    new Popup()
      ..width = 200
      ..height = 150
      ..style.backgroundColor = "orange"
      ..addToDocument()
      ..locateTo("south start", btn2);
  });
  view.addChild(btn2);

  new Section()
    ..addChild(view)
    ..addToDocument();
}
