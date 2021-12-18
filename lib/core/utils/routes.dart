import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../main.dart';

class Routes {
  const Routes();
  static const firstPage = '/';
  static const instance = Routes();
  List<GetPage<Widget>> getScreens() {
    return <GetPage<Widget>>[
      GetPage(name: firstPage, page: () => const FirstPage()),
    ];
  }
}
