import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:project_template/core/localization/custom_translations.dart';
import 'package:project_template/core/localization/language_enum.dart';
import 'package:project_template/core/localization/lnaguages_enum.dart';

void main() async {
  group('Localization', () {
    testWidgets('language', (WidgetTester tester) async {
      await tester.pumpWidget(const _MyApp());

      expect(find.text(Language.appName.tr), findsOneWidget);
      debugPrint(Language.appName.tr);
    });
  });
}

class _MyApp extends StatelessWidget {
  const _MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GetMaterialApp(
        translations: CustomTranslations(),
        locale: Locale(Languages.en.name),
        fallbackLocale: Locale(Languages.en.name),
        home: const FirstPage(),
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
          Text(Language.appName.tr),
          Align(
            child: TextButton.icon(
              onPressed: () {
                Get.updateLocale(Locale(Languages.ar.name));
              },
              icon: const Icon(Icons.language),
              label: const Text('Change to Ar'),
            ),
          ),
          Align(
            child: TextButton.icon(
              onPressed: () {
                Get.updateLocale(Locale(Languages.en.name));
              },
              icon: const Icon(Icons.language),
              label: const Text('Change to EN'),
            ),
          )
        ],
      ),
    );
  }
}
