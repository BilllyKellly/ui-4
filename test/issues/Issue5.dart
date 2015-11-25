import 'package:rikulo_ui/view.dart';

void main() {
  Button btn = new Button("Click me to show switches and check if one is on and the other off");
  btn.profile.text = "anchor:parent;location:top center";
  
  final View mainView = new View()..addToDocument();
  mainView.addChild(btn);

  View myView = new View();
  myView.visible = false;
  myView.layout.text = "type: linear; orient: vertical";
  mainView.addChild(myView);

  btn.on.click.listen((event) {
    myView.visible = !myView.visible;
  });

  myView.addChild(new Switch(true));
  myView.addChild(new Switch(false));
}