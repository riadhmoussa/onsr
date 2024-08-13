import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordController extends GetxController {
  var email = ''.obs;
  var isLoading = false.obs;
  var message = ''.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void resetPassword() async {
    if (email.value.isEmpty) {
      message.value = 'البريد الإلكتروني مطلوب';
      return;
    }

    isLoading.value = true;
    try {
      await _auth.sendPasswordResetEmail(email: email.value);
      message.value = 'تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني';
    } catch (e) {
      message.value = 'حدث خطأ: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }
}
