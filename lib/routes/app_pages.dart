import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:onsr/bindings/login_binding.dart';
import 'package:onsr/bindings/splash_binding.dart';
import 'package:onsr/views/age_distribution_screen.dart';
import 'package:onsr/views/calendar_screen.dart';
import 'package:onsr/views/claim_screen.dart';
import 'package:onsr/views/forgot_password_screen.dart';
import 'package:onsr/views/language_selection_screen.dart';
import 'package:onsr/views/login_screen.dart';
import 'package:onsr/views/map_screen.dart';
import 'package:onsr/views/register_screen.dart';
import 'package:onsr/views/result_stat_screen.dart';
import 'package:onsr/views/splash_screen.dart';
import 'package:onsr/views/traffic_center_screen.dart';

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
    GetPage(
      name: AppRoutes.calender,
      page: () => CalendarScreen(),
    ),
    GetPage(
      name: AppRoutes.trafficCenter,
      page: () => TrafficCenterScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: AppRoutes.claims,
      page: () => ClaimScreen(),
    ),
    GetPage(
      name: AppRoutes.openData,
      page: () => AgeDistributionScreen(),
    ),
    GetPage(
      name: AppRoutes.languages,
      page: () => LanguageSelectionScreen(),
    ),
    GetPage(
      name: AppRoutes.regionsMap,
      page: () => RegionsScreen(),
    ),
  ];
}
