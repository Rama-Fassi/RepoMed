import 'package:intl/intl.dart';

class Language {
  static bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }

  static bool isEnglish() {
    return Intl.getCurrentLocale() == 'en';
  }
}
