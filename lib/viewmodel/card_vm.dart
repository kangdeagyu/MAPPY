import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_main_project/model/card_model.dart';
import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:final_main_project/viewmodel/purchase_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardVm extends GetxController {
  // 카드 번호 상태관리
  RxString stCardnumber = ''.obs;
  RxString stCarddate = ''.obs;
  RxString stCardcvc = ''.obs;
  Rx<TextEditingController> numberController = TextEditingController().obs;
  Rx<TextEditingController> dateController = TextEditingController().obs;
  Rx<TextEditingController> cvcController = TextEditingController().obs;

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
    stCardcvc.value = cardSvv;
  }

  // 초기화
  void remove() {
    stCardnumber.value = "";
    stCarddate.value = "";
    stCardcvc.value = "";
    numberController.value.text = "";
    dateController.value.text = "";
    cvcController.value.text = "";
  }

  // 카드 데이터베이스 상태관리
  var cardDataList = <CardModel>[].obs; // Observable List
  var uId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    remove();
    loadUserID().then((value) => userCardData());
  }

  // 유저 아이디 들고오기
  Future<void> loadUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uId.value = prefs.getString("p_userId") ?? '';
  }

  // 저장된 유저 아이디, 테마, 알림 설정 지우기
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("p_userId");
    prefs.remove('isDarkMode');
    prefs.remove('notificationMode');
    // 인스턴스 지우기
    Get.delete<PurchaseVM>();
    Get.delete<CardVm>();
    Get.delete<AgeVM>();
  }

  // 카드 정보 불러오기
  Future<void> userCardData() async {
    String userid = uId.value;
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('card')
          .where('uid', isEqualTo: userid)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs) {
          cardDataList.add(CardModel.fromDocument(doc));
        }
      }
    } catch (e) {
      print(e.toString());
      // 에러 처리를 추가합니다.
    }
  }

  void clearMyData() {
    cardDataList.clear();
  }

  // 카드 등록
  Future<void> addCard(CardModel card) async {
    try {
      CollectionReference cardsRef =
          FirebaseFirestore.instance.collection('card');

      DocumentReference docRef = await cardsRef.add({
        'uid': card.uid,
        'number': card.number,
        'date': card.date,
        'cvc': card.cvc,
      });
      CardModel updatedNewCard = CardModel(
          id: docRef.id,
          uid: card.uid,
          number: card.number,
          date: card.date,
          cvc: card.cvc);

      cardDataList.add(updatedNewCard);
    } catch (e) {
      print(e);
    }
  }

  // 등록 카드 삭제
  Future<void> deleteCard(CardModel card) async {
    try {
      CollectionReference cardsRef =
          FirebaseFirestore.instance.collection('card');

      await cardsRef.doc(card.id).delete();

      cardDataList.remove(card);
    } catch (e) {
      print(e);
    }
  }
}
