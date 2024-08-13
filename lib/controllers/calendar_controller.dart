import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsr/models/journee_model.dart';
import 'package:onsr/utils/data_service.dart';
import 'package:onsr/utils/http_client.dart';

class CalendarController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var currentMonth = DateTime.now().obs;
  var statisticModelList = <Journee>[].obs;
  var isLoading = true.obs;
  final DataService dataService = DataService(
      httpClient: HttpClient(
          baseUrl: 'https://onsr.nat.tn/onsr/dataxml/xmltojsonfile.php'));

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      isLoading.value = true;
      final result = await dataService.fetchData("calendar", "");
      statisticModelList.value = (result['journee'] as List)
          .map((item) => Journee.fromJson(item))
          .toList();
      print("statisticModelList");
      print(statisticModelList.value);
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;

    // Find the data for the selected date or return a default Journee object
    final selectedData = statisticModelList.firstWhere(
          (journee) =>
      journee.jour == date.day.toString() &&
          journee.mois == date.month.toString() &&
          journee.annee == date.year.toString(),
      orElse: () => Journee(jour: '', mois: '', annee: '', accidents: '0', tues: '0', blesses: '0'),
    );

    // Show dialog with the selected data
    Get.defaultDialog(
      title: 'تفاصيل الحادث',
      titleStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      contentPadding: EdgeInsets.all(16.0),
      content: selectedData.accidents == '0' && selectedData.tues == '0' && selectedData.blesses == '0'
          ? Text(
        'لا توجد بيانات لهذا اليوم',
        style: TextStyle(fontSize: 16.0),
        textAlign: TextAlign.center,
      )
          : Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLabel('عدد الحوادث: ${selectedData.accidents}', Colors.red),
          _buildLabel('عدد القتلى: ${selectedData.tues}', Colors.green),
          _buildLabel('عدد الجرحى: ${selectedData.blesses}', Colors.blue),
        ],
      ),
      barrierDismissible: true,
    );
  }

  void previousMonth() {
    currentMonth.value =
        DateTime(currentMonth.value.year, currentMonth.value.month - 1);
  }

  void nextMonth() {
    currentMonth.value =
        DateTime(currentMonth.value.year, currentMonth.value.month + 1);
  }

  Widget _buildLabel(String text, Color color) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: Colors.white,
            size: 20.0,
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
