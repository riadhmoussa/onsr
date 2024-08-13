import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/calendar_controller.dart'; // Adjust the import according to your folder structure

class CalendarScreen extends StatelessWidget {
  final CalendarController controller = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('جدول إحصائيات حوادث المرور', style: TextStyle(fontSize: 16)),
        backgroundColor: Colors.black,
      ),
      body: Obx(() {
        return Column(
          children: [
            _buildHeader(),
            Expanded(
              child: _buildCalendar(),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () => controller.previousMonth(),
        ),
        Text(
          '${controller.currentMonth.value.month}/${controller.currentMonth.value.year}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: Icon(Icons.arrow_right),
          onPressed: () => controller.nextMonth(),
        ),
      ],
    );
  }

  Widget _buildCalendar() {
    final startOfMonth = DateTime(controller.currentMonth.value.year, controller.currentMonth.value.month, 1);
    final daysInMonth = DateUtils.getDaysInMonth(controller.currentMonth.value.year, controller.currentMonth.value.month);
    final startDay = startOfMonth.weekday;
    final days = List.generate(daysInMonth, (index) {
      return DateTime(controller.currentMonth.value.year, controller.currentMonth.value.month, index + 1);
    });

    final weekDays = ['الأحد', 'الاثنين', 'الثلاثاء', 'الأربعاء', 'الخميس', 'الجمعة', 'السبت'];

    return Column(
      children: [
        _buildWeekdayHeaders(weekDays),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
            itemCount: startDay + daysInMonth,
            itemBuilder: (context, index) {
              if (index < startDay) {
                return Container(); // Empty space for days before the start of the month
              }
              final day = days[index - startDay];
              final isToday = day.day == DateTime.now().day &&
                  day.month == DateTime.now().month &&
                  day.year == DateTime.now().year;

              return GestureDetector(
                onTap: () => controller.selectDate(day),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8.0),
                    color: isToday ? Colors.blueAccent : Colors.white,
                    boxShadow: isToday ? [BoxShadow(color: Colors.blue, blurRadius: 4.0)] : [],
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                        color: isToday ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildWeekdayHeaders(List<String> weekDays) {
    return Row(
      children: weekDays.map((day) {
        return Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 8.0),
            color: Colors.grey[300],
            child: Text(
              day,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      }).toList(),
    );
  }
}
