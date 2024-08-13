import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClaimController extends GetxController {
  // Observables
  var email = ''.obs;
  var subject = ''.obs;
  var description = ''.obs;
  var isLoading = false.obs;

  // Firebase instances
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Send claim method
  Future<void> sendClaim() async {
    if (_validateInputs()) {
      try {
        isLoading.value = true;

        // Get current user's UID
        User? user = _auth.currentUser;
        String userId = user?.uid ?? 'unknown';

        // Prepare the claim data
        Map<String, dynamic> claimData = {
          'email': email.value.trim(),
          'subject': subject.value.trim(),
          'description': description.value.trim(),
          'userId': userId,
          'timestamp': FieldValue.serverTimestamp(),
        };

        // Save claim data to Firestore
        await _firestore.collection('claims').add(claimData);

        // Show success message
        Get.snackbar(
          "نجاح",
          "تم إرسال المطالبة بنجاح",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Clear fields after sending
        email.value = '';
        subject.value = '';
        description.value = '';
      } catch (e) {
        Get.snackbar(
          "خطأ",
          "فشل إرسال المطالبة: ${e.toString()}",
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
    if (subject.value.isEmpty) {
      Get.snackbar(
        "خطأ",
        "الموضوع مطلوب",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    if (description.value.isEmpty) {
      Get.snackbar(
        "خطأ",
        "الوصف مطلوب",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }
}
