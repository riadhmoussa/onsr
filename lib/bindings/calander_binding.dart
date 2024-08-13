import 'package:get/get.dart';
import 'package:onsr/controllers/calendar_controller.dart';


class CalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalendarController>(() => CalendarController());
  }
}