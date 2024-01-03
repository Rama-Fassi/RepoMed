import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

// class Language {
//   static bool isArabic() {
//     return Intl.getCurrentLocale() == 'ar';
//   }
//
//   static bool isEnglish() {
//     return Intl.getCurrentLocale() == 'en';
//   }
// }

class Language {
  static Locale getCurrentLocale(BuildContext context) {
    return Localizations.localeOf(context);
  }

  static bool isArabic(BuildContext context) {
    final currentLocale = getCurrentLocale(context);
    return currentLocale.languageCode == 'ar';
  }

  static bool isEnglish(BuildContext context) {
    final currentLocale = getCurrentLocale(context);
    return currentLocale.languageCode == 'en';
  }
}
