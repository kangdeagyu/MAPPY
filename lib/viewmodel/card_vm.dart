import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_main_project/model/card_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardVm extends GetxController {
  var cardDataList = <CardModel>[].obs; // Observable List
  var uId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserID().then((value) => userCardData());
  }

  // 유저 아이디 들고오기
  Future<void> loadUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uId.value = prefs.getString("p_userId") ?? '';
  }

  // 저장된 유저 아이디 지우기
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("p_userId"); // 사용자 ID를 삭제합니다.
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
