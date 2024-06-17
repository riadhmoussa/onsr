import 'package:get/get.dart';
import 'package:onsr/routes/app_routes.dart';

import '../models/option_stat.dart';

class StatController extends GetxController {
  RxString selectedYear = '2024'.obs;
  RxString selectedOption = "cause".obs;
  List<String> years = ['2020', '2021', '2022', '2023', '2024'];
  List<OptionStat> options = [
    OptionStat('الأسباب', "cause"),
    OptionStat('مشاركة الأطراف', "implique"),
    OptionStat('الساعات', "heure"),
    OptionStat('الأشهر', "mois"),
    OptionStat('أنواع الطرقات', "route"),
    OptionStat('الولايات', "gouvernorat"),
    OptionStat('الضحايا', "victime"),
  ];

  void setSelectYear(String year) {
    selectedYear.value = year;
  }

  void selectOption(String optionValue) {
    selectedOption.value = optionValue;
  }

  void goToResultScreen() {
    Get.toNamed(
      AppRoutes.resultStat,
      arguments: {
        'year': selectedYear.value,
        'option': selectedOption.value,
      },
    );
  }
}

