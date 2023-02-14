import 'package:flutter/cupertino.dart';

normalNav(BuildContext context, Widget screen) {
  Navigator.push(context, CupertinoPageRoute(builder: (ctx) => screen));
}
