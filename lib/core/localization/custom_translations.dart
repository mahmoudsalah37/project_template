import 'package:get/get.dart';
import 'package:project_template/core/localization/lnaguages_enum.dart';

import 'language_json.dart';

class CustomTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        Languages.en.name: LanguageJson.en,
        Languages.ar.name: LanguageJson.ar,
      };
}
