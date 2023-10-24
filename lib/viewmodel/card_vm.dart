import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardGet extends GetxController {
  // 카드 번호 상태관리
  RxString stCardnumber = ''.obs;
  RxString stCarddate = ''.obs;
  RxString stCardsvv = ''.obs;
  Rx<TextEditingController> numberController = TextEditingController().obs;
  Rx<TextEditingController> dateController = TextEditingController().obs;
  Rx<TextEditingController> svvController = TextEditingController().obs;

  // 카드 번호를 업데이트하는 메서드
  void updateCardNumber(String cardNumber) {
    stCardnumber.value = cardNumber;
  }

  // 날짜를 업데이트하는 메서드
  void updateCardDate(String cardDate) {
    stCarddate.value = cardDate;
  }

  // svv를 업데이트하는 메서드
  void updateCardSvv(String cardSvv) {
    stCardsvv.value = cardSvv;
  }
}
