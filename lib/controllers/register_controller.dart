import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:onsr/routes/app_routes.dart';

class RegisterController extends GetxController {
  // Observables
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var isLoading = false.obs;

  // FirebaseAuth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Register method
  Future<void> register() async {
    if (_validateInputs()) {
      try {
        isLoading.value = true;
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email.value.trim(),
          password: password.value.trim(),
        );
        if (userCredential.user != null) {
          Get.snackbar(
            "نجاح",
            "تم تسجيل الحساب بنجاح",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Get.offNamed(AppRoutes.dashboard); // Navigate to dashboard screen
        }
      } on FirebaseAuthException catch (e) {
        Get.snackbar(
          "خطأ",
          e.message ?? "فشل تسجيل الحساب",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  bool _validateInputs() {
    if (email.value.isEmpty || !email.value.contains('@')) {
      Get.snackbar(
        "خطأ",
        "البريد الإلكتروني غير صالح",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    if (password.value.length < 6) {
      Get.snackbar(
        "خطأ",
        "يجب أن تكون كلمة المرور لا تقل عن 6 أحرف",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    if (password.value != confirmPassword.value) {
      Get.snackbar(
        "خطأ",
        "كلمات المرور لا تتطابق",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }
}
