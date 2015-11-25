//Sample Code: Test Query

import 'package:rikulo_ui/view.dart';
import 'package:rikulo_ui/view/select.dart';

void assertIdentical(String src) {
  assertLegal(src, "[${src}]");
}

void assertLegal(String src, [String result]) {
  try {
    List<Selector> selectors = Selectors.parse(src);
    if (result != null) {
      String r = selectors.toString();
      if (r != result)
        logMsg("* Unexpected parse result: ${r} (expecting ${result})");
    }
  } on SelectorParseException catch (_) {
    logMsg("* Should be legal: ${src}");
  }
}

void assertIllegal(String src) {
  try {
    Selectors.parse(src);
    logMsg("* Should be illegal: ${src}");
  } on SelectorParseException catch (_) {
  }
}

void logMsg(String msg) {
  mainView.addChild(new TextView(msg));
}

View mainView;

void main() {
  mainView = new View()..addToDocument();
  mainView.layout.type = "linear";
  mainView.layout.orient = "vertical";
  
  logMsg("The failed cases are shown below:");
  
  // legal
  assertIdentical("type#id");
  assertIdentical("type > type ~ type type");
  assertIdentical("#id .c1 + :p1");
  assertIdentical("#id, type, .cls");
  assertIdentical("#id type, .cls > #id");
  assertIdentical("* #id, #id *, *");
  assertIdentical("type:pcls(abc)");
  
  assertLegal("type.c1:p1#id:p2.c2");
  assertLegal("#id , type,   .cls   +   type");
  
  // illegal
  assertIllegal("#id#id");
  assertIllegal("#id > > #id");
  assertIllegal("#id> #id");
  assertIllegal("#id >#id");
  assertIllegal("> #id");
  assertIllegal(" > #id");
  assertIllegal("#id >");
  assertIllegal("#id > ");
  assertIllegal("*#id");
  assertIllegal("*.cls");
  assertIllegal("*:pcls");
  assertIllegal("type:pcls(");
  assertIllegal("type:pcls(abc");
  assertIllegal("type#");
  assertIllegal("type:");
  assertIllegal("type.");
  assertIllegal("type# type");
  assertIllegal("type: type");
  assertIllegal("type. type");
  assertIllegal("type# > type");
  assertIllegal("type: > type");
  assertIllegal("type. > type");
  assertIllegal("type+ type");
  assertIllegal("type +type");
  assertIllegal("+ type");
  assertIllegal("type +, #id");
  assertIllegal("type, + #id");
  assertIllegal("type,");
  assertIllegal(",type");
  assertIllegal("type#,");
  assertIllegal("type:,");
  assertIllegal("type.,");
}
