import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_template/core/localization/get_language_from_cache.dart';
import 'core/localization/custom_translations.dart';
import 'core/localization/language_enum.dart';
import 'core/localization/lnaguages_enum.dart';
import 'core/src/themes/theme.dart';
import 'core/utils/initial_binding.dart';
import 'core/utils/injection_container.dart';
import 'core/utils/routes.dart';

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
        supportedLocales: [
          Locale(Languages.en.name),
          Locale(Languages.en.name)
        ],
        theme: CustomsThemes.defaultThemeData,
        translations: CustomTranslations(),
        locale: Locale(GetStorage().read("lang") ?? Languages.en.name),
        fallbackLocale: Locale(Languages.en.name),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],
        initialBinding: InitialBinding(),
        getPages: Routes.instance.getScreens(),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              Language.appName.tr,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            Align(
              child: TextButton.icon(
                onPressed: () {
                  Get.updateLocale(Locale(Languages.ar.name));
                  AppLanguage().changeLanguage('ar');
                },
                icon: const Icon(Icons.language),
                label: const Text('Change to Ar'),
              ),
            ),
            Align(
              child: TextButton.icon(
                onPressed: () {
                  Get.updateLocale(Locale(Languages.en.name));
                  AppLanguage().changeLanguage(Languages.en.name);
                },
                icon: const Icon(Icons.language),
                label: const Text('Change to EN'),
              ),
            ),
            Align(
              child: TextButton.icon(
                onPressed: () {
                  Get.changeTheme(CustomsThemes.darkThemeData);
                },
                icon: const Icon(Icons.language),
                label: const Text('Dark Mode'),
              ),
            ),
            Align(
              child: TextButton.icon(
                onPressed: () {
                  Get.changeTheme(CustomsThemes.lightThemeData);
                },
                icon: const Icon(Icons.language),
                label: const Text('Light Mode'),
              ),
            ),
          ],
        ));
  }
}
