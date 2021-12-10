import 'dart:collection';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:movie/resources/strings/value/st_en_us.dart';
import 'package:movie/resources/strings/value/st_vi_vn.dart';

class LocalizationService extends Translations {
  static final locale = _getLocateFromLanguage();
  static const fallbackLocale = Locale('en', 'US');
  static const langCodes = ['en', 'vi'];
  static const locales = [Locale('en', 'US'), Locale('vi', 'VN')];
  static final langs =
      LinkedHashMap.from({'en': 'English', 'vi': 'Tiếng Việt'});

  static void changeLocale(String langCode) {
    final locale = _getLocateFromLanguage(langCode: langCode);
    Get.updateLocale(locale);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'vi_VN': vi,
      };
  static _getLocateFromLanguage({String? langCode}) {
    var lang = langCode ?? Get.deviceLocale?.languageCode;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
    }
    return Get.locale;
  }
}
