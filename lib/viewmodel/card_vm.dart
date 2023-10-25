import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_main_project/model/card_model.dart';
import 'package:get/get.dart';

class CardVm extends GetxController {
  var cardDataList = <CardModel>[].obs; // Observable List

  @override
  void onInit() {
    super.onInit();
    String userId = 'wook';
    userCardData(userId);
  }

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

      // Update the new document's ID in the model and add it to the list.
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
