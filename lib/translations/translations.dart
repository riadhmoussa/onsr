import 'package:get/get.dart';
import 'ar_SA.dart';
import 'fr_FR.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'ar_SA': arSa,
    'fr_FR': frFr,
  };
}
