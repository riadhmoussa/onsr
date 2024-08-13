import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../models/option_model.dart';
import '../routes/app_routes.dart';

class DashboardController extends GetxController
    with SingleGetTickerProviderMixin {
  var options = <OptionModel>[].obs;
  late AnimationController animationController;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..forward();
    loadOptions();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void loadOptions() {
    options.addAll([
      OptionModel(title: 'إحصائيات|Stat', route: AppRoutes.stat),
      OptionModel(title: "إحصائيات حوادث المرور", route: AppRoutes.calender),
      OptionModel(title: "مراكز حرس المرور", route: AppRoutes.trafficCenter),
      OptionModel(
          title: 'إحصائيات القتلى الأطفال',
          route: AppRoutes.statsKilledChildren),
      OptionModel(title: 'إرسال المطالبات', route: AppRoutes.claims),
      OptionModel(title: 'البيانات المفتوحة', route: AppRoutes.openData),
      OptionModel(title: 'المزيد من الإحصائيات', route: AppRoutes.moreStats),
      OptionModel(title: 'الطرقات المرقمة', route: AppRoutes.numberedRoads),
      OptionModel(title: 'النقاط السوداء', route: AppRoutes.blackSpots),
      OptionModel(
          title: 'الحوادث حسب السنوات', route: AppRoutes.accidentsByYear),
      OptionModel(
          title: 'مفاهيم إحصائية', route: AppRoutes.statisticalConcepts),
    ]);
  }
}
