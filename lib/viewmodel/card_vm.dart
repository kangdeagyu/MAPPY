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
}
