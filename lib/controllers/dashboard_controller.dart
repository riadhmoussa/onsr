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
      OptionModel(title: 'stats'.tr, route: AppRoutes.stat),
      OptionModel(title: 'traffic_stats'.tr, route: AppRoutes.calender),
      OptionModel(title: 'traffic_centers'.tr, route: AppRoutes.trafficCenter),
      OptionModel(
          title: 'child_deaths_stats'.tr, route: AppRoutes.regionsMap),
      OptionModel(title: 'claims'.tr, route: AppRoutes.claims),
      OptionModel(
          title: 'age_deaths_distribution'.tr, route: AppRoutes.openData),
      OptionModel(title: 'more_stats'.tr, route: AppRoutes.moreStats),
      OptionModel(title: 'numbered_roads'.tr, route: AppRoutes.numberedRoads),
      OptionModel(title: 'black_spots'.tr, route: AppRoutes.blackSpots),
      OptionModel(
          title: 'accidents_by_year'.tr, route: AppRoutes.accidentsByYear),
      OptionModel(
          title: 'statistical_concepts'.tr,
          route: AppRoutes.statisticalConcepts),
      OptionModel(title: 'language'.tr, route: AppRoutes.languages),
      OptionModel(title: 'logout'.tr),
    ]);
  }
}
