import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsr/routes/app_pages.dart';
import 'package:onsr/routes/app_routes.dart';
import 'package:onsr/utils/my_http_overrides.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'المرصد الوطني لسلامة المرور',
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
