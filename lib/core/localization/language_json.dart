import 'package:project_template/core/localization/languages/ar.dart';
import 'package:project_template/core/localization/languages/en.dart';

class LanguageJson {
  static Map<String, String> get en => getEnglishTranslation();
  static Map<String, String> get ar => getArabicTranslation();
}
