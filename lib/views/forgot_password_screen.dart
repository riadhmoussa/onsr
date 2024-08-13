import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:onsr/controllers/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final ForgotPasswordController _forgotPasswordController =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('نسيت كلمة المرور'),
        backgroundColor: Colors.red.shade800,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 30),
                _buildEmailField(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _forgotPasswordController.isLoading.value
                      ? null
                      : () => _forgotPasswordController.resetPassword(),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red.shade800,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: _forgotPasswordController.isLoading.value
                      ? CircularProgressIndicator()
                      : Text(
                          'إرسال رابط إعادة تعيين',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
                SizedBox(height: 20),
                if (_forgotPasswordController.message.value.isNotEmpty)
                  Text(
                    _forgotPasswordController.message.value,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
              ],
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red.shade800),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red.shade800),
        ),
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) => _forgotPasswordController.email.value = value,
      validator: MultiValidator([
        RequiredValidator(errorText: 'البريد الإلكتروني مطلوب'),
        EmailValidator(errorText: 'أدخل بريد إلكتروني صالح'),
      ]),
    );
  }
}
