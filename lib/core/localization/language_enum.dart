import 'package:get/get_utils/src/extensions/internacionalization.dart';

enum Language {
  appName,
}

extension TR on Language {
  String get tr => name.tr;
}
