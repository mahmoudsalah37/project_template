import 'package:get_it/get_it.dart';

class Injection {
  static final instance = Injection();
  final _sl = GetIt.instance;

  Future<void> init() async {}
}
