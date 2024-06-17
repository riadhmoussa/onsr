
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:onsr/bindings/splash_binding.dart';
import 'package:onsr/views/result_stat_screen.dart';
import 'package:onsr/views/splash_screen.dart';

import '../bindings/dashboard_binding.dart';
import '../views/dashboard_screen.dart';
import '../views/stat_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.stat,
      page: () => StatView(),
    ),
    GetPage(
      name: AppRoutes.resultStat,
      page: () => ResultStatScreen(),
    ),
  ];
}
