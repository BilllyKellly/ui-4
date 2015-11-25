//Sample Code: LinearLayout Test 4

import 'dart:html';
import 'package:rikulo_ui/view.dart';
import 'package:rikulo_ui/event.dart';

void _addOrientation(View parent) {
  View view = new View();
  _setBorder(view);
  _setHLayout(view);
  parent.addChild(view);

  TextView text = new TextView("Orientation");
  _setBorder(text);
  view.addChild(text);

  CheckBox ckbox = new CheckBox("checkbox sample");
  _setBorder(ckbox);
  int clickCount = 0;
  ckbox.on.change.listen((ChangeEvent<bool> event) {
    ckbox.text = 'value: ${event.value} ${++clickCount}';
    ckbox.requestLayout();
  });
  view.addChild(ckbox);

  _addTextWithMaxWidth(view, 150);
}

void _addLogView(View view) {
  View logView = new View();
  logView.layout.type = "linear";
  logView.layout.orient = "vertical";
  logView.layout.spacing = "0";
  logView.profile.width = logView.profile.height = "flex";
  logView.style.backgroundColor = "#cca";
  _setBorder(logView);
  TextView text = new TextView.fromHtml('<h2 style="margin:0">Log View</h2>');
  _setBorder(text);
  logView.addChild(text);

  view.addChild(logView);
}

void _setBorder(View view) {
  view.style.border = "1px solid black";
}

void _setHLayout(View view) {
  view.layout.type = "linear";
  view.layout.width = "content";
  view.profile.width = "flex";
  view.profile.height = "content";
}

void _addTextWithMaxWidth(View view, int maxWd) {
  TextView text = new TextView("This is limited by max-width:${maxWd}");
  _setBorder(text);
  text.profile.maxWidth = maxWd.toString();
  view.addChild(text);
}

void main() {
  final View mainView = new View()..addToDocument();
  
  View view = new View();
  _setBorder(view);
  view.layout.type = "linear";
  view.layout.orient = "vertical";
  view.profile.width = view.profile.height = "flex";
  mainView.addChild(view);

  TextView text = new TextView.fromHtml('<h1 style="margin:0">${document.title}</h1>');
  _setBorder(text);
  view.addChild(text);

  text = new TextView("Description here");
  _setBorder(text);
  view.addChild(text);
  
  _addOrientation(view);
  _addLogView(view);
}
