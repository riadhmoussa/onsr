import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:onsr/controllers/claim_controller.dart';

class ClaimScreen extends StatelessWidget {
  final ClaimController _claimController = Get.put(ClaimController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إرسال مطالبة'),
        backgroundColor: Color(0xFFff0000), // Set app bar color
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'إرسال مطالبة',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildEmailField(),
                  SizedBox(height: 16),
                  _buildSubjectField(),
                  SizedBox(height: 16),
                  _buildDescriptionField(),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _claimController.isLoading.value
                        ? null
                        : () => _claimController.sendClaim(),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Color(0xFFff0000), // Button color
                    ),
                    child: _claimController.isLoading.value
                        ? CircularProgressIndicator()
                        : Text('إرسال'),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'البريد الإلكتروني',
        border: OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) => _claimController.email.value = value,
      validator: MultiValidator([
        RequiredValidator(errorText: 'البريد الإلكتروني مطلوب'),
        EmailValidator(errorText: 'أدخل بريد إلكتروني صالح'),
      ]),
    );
  }

  Widget _buildSubjectField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'الموضوع',
        border: OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: (value) => _claimController.subject.value = value,
      validator: RequiredValidator(errorText: 'الموضوع مطلوب'),
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'الوصف',
        border: OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
      ),
      maxLines: 5,
      onChanged: (value) => _claimController.description.value = value,
      validator: RequiredValidator(errorText: 'الوصف مطلوب'),
    );
  }
}
