import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  const Routes();
  static const instance = Routes();
  List<GetPage<Widget>> getScreens() {
    return <GetPage<Widget>>[];
  }
}
