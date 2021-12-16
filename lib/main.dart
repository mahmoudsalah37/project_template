import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_template/core/utils/enums.dart';

import 'core/localization/custom_translations.dart';
import 'core/utils/routes.dart';
import 'core/src/theme.dart';
import 'core/utils/initial_binding.dart';
import 'core/utils/injection_container.dart';

void main() async {
  await _init();
  runApp(const MyApp());
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.instance.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomsThemes.instance.defaultThemeData,
        translations: CustomTranslations(),
        fallbackLocale: Locale(Languages.en.name),
        initialBinding: InitialBinding(),
        getPages: Routes.instance.getScreens(),
      ),
    );
  }
}
