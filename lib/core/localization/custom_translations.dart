import 'package:get/get.dart';

import 'language_json.dart';
import 'lnaguages_enum.dart';

class CustomTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        Languages.en.name: LanguageJson.en,
        Languages.ar.name: LanguageJson.ar,
      };
}
