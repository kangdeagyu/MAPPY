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
    loadUserID().then((userId) {
      // loadUserID가 완료된 후에 userCardData를 호출합니다.
      userCardData(userId);
    });
  }

  // 유저 아이디 들고오기
  Future<String> loadUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uId.value = prefs.getString("p_userId") ?? '';
    return uId.value;
  }

  // 저장된 유저 아이디 지우기
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("p_userId"); // 사용자 ID를 삭제합니다.
  }

  // 카드 있으면 가져오기
  Future<void> userCardData(String userId) async {
    try {
      var collection = FirebaseFirestore.instance.collection('card');
      var snapshot = await collection.where('uid', isEqualTo: userId).get();
      if (snapshot.docs.isNotEmpty) {
        for (var doc in snapshot.docs) {
          cardDataList.add(CardModel.fromDocument(doc));
        }
      }
    } catch (e) {
      // 에러 처리...
      print(e);
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
