import 'package:flutter/material.dart';

void pushPage(BuildContext context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => page,),);
}

void pushReplacementPage(BuildContext context, Widget page) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => page,),);
}

void pushAndRemoveUntilPage(BuildContext context, Widget page) {
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => page,), ModalRoute.withName('/'));
}

void popPage(BuildContext context, Widget page) {
  Navigator.of(context).pop(MaterialPageRoute(builder: (_) => page,),);
}
