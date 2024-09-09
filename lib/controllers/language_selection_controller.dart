import 'dart:ui';
import 'package:get/get.dart';
import 'package:onsr/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class LanguageController extends GetxController {
  final RxString _locale = 'ar'.obs;

  String get locale => _locale.value;

  @override
  void onInit() {
    super.onInit();
    _loadSavedLanguage();
  }

  void _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString('language') ?? 'fr';
    _locale.value = savedLanguage;
    Get.updateLocale(Locale(savedLanguage));
  }

  void setLocale(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', langCode);
    _locale.value = langCode;
    Get.updateLocale(Locale(langCode));
    restartApp();
  }

  void restartApp() {
    Get.offAllNamed(AppRoutes.splash);
  }
}
