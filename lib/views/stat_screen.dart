import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsr/controllers/stat_controller.dart';

class StatView extends StatelessWidget {

  const StatView({super.key});

  @override
  Widget build(BuildContext context) {
    final StatController statController = Get.put(StatController());

    return Scaffold(
      appBar: AppBar(
        title: Text('إحصائيات|Stat'),
      ),
      body: Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var year in statController.years)
                  GestureDetector(
                    onTap: () => statController.setSelectYear(year),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: year == statController.selectedYear.value
                              ? const Color(0xFFff0000)
                              : Colors.black,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: year == statController.selectedYear.value
                            ? const Color(0xFFff0000).withOpacity(0.2)
                            : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          year,
                          style: TextStyle(
                            color: year == statController.selectedYear.value
                                ? const Color(0xFFff0000)
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                for (var option in statController.options)
                  SelectableOption(
                    label: option.label,
                    value: option.value,
                    isSelected:
                    option.value == statController.selectedOption.value,
                    onTap: () => statController.selectOption(option.value),
                  ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    statController.goToResultScreen();
                  },
                  child: Text("النتائج"),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class SelectableOption extends StatelessWidget {
  final String label;
  final String value;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableOption({
    Key? key,
    required this.label,
    required this.value,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Color(0xFFff0000) : Colors.grey),
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? Color(0xFFff0000).withOpacity(0.2) : Colors.white,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 18,
              color: isSelected ? Color(0xFFff0000) : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
