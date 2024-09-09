import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsr/controllers/language_selection_controller.dart';

class LanguageSelectionScreen extends StatelessWidget {
  final LanguageController _controller = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('language_selection'.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'select_language'.tr,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.language, color: Colors.blue),
                title: const Text('French'),
                subtitle: const Text('Français'),
                onTap: () => _controller.setLocale('fr'),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.language, color: Colors.green),
                title: const Text('Arabic'),
                subtitle: const Text('العربية'),
                onTap: () => _controller.setLocale('ar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
