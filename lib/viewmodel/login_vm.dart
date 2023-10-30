import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginVM extends GetxController {
  // property
  late TextEditingController uidController;
  late TextEditingController upasswordController;
  bool passwordVisible = false;

  @override
  void onInit() {
    super.onInit();
    // share pref 로 값 받아서 id에 값 넣어주기
    // initSharedPreferences().then((_) {
    //   selectFirebase().then((_) {
    //     initValueTF();
    //   });
    uidController = TextEditingController();
    upasswordController = TextEditingController();
  }

  transPW() {
    passwordVisible = !passwordVisible;
    update();
  }
}
