import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_main_project/model/card_model.dart';
import 'package:get/get.dart';

class CardVm extends GetxController {
  var cardDataList = <CardModel>[].obs; // Observable List

  @override
  void onInit() {
    super.onInit();
    userCardData();
  }

  Future<void> userCardData() async {
    try {
      var collection = FirebaseFirestore.instance.collection('card');
      var snapshot = await collection.get();
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

  Future<void> addCard(CardModel card) async {
    // 카드 추가 메소드
    try {
      CollectionReference cardsRef =
          FirebaseFirestore.instance.collection('card');

      await cardsRef.add({
        'uid': card.uid,
        'number': card.number,
        'date': card.date,
        'cvc': card.cvc,
      });

      cardDataList.add(card);
    } catch (e) {
      print(e);
      // 에러 처리...
    }
  }
}
