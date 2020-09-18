import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ResponsiveScreen {
  static final ResponsiveScreen _singleton = ResponsiveScreen._internal();

  factory ResponsiveScreen() {
    return _singleton;
  }

  ResponsiveScreen._internal();

  double webWidthMediaQuery(BuildContext context, double width) {
    return MediaQuery.of(context).size.width * width / 1536;
  }

  double webHeightMediaQuery(BuildContext context, double height) {
    return MediaQuery.of(context).size.height * height / 754.4;
  }
}
