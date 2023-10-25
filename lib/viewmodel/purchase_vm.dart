import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PurchaseVM extends GetxController {
  var isProcessing = false.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> updateCoin(int coin) async {
    String uid = 'wook'; // 유저 아이디로 바꿔야됨

    try {
      QuerySnapshot querySnapshot =
          await firestore.collection('user').where('uid', isEqualTo: uid).get();

      if (querySnapshot.docs.isNotEmpty) {
        String docId = querySnapshot.docs.first.id;

        // 현재 코인 값 가져오기
        DocumentSnapshot docSnapshot =
            await firestore.collection('user').doc(docId).get();
        int currentCoin = docSnapshot.get('coin');

        // 현재 코인 값에 새로운 코인 값을 더해 업데이트
        await firestore.collection('user').doc(docId).update({
          'coin': currentCoin + coin,
        });
      }
    } catch (e) {
      print(e.toString());
      // 에러 처리를 추가합니다.
    }
  }

  Future<void> makePayment(int coin) async {
    isProcessing.value = true;

    await Future.delayed(const Duration(seconds: 2));
    await updateCoin(coin);

    Get.back();
    Get.back();

    Get.snackbar("결제 완료", "결제가 완료되었습니다.", snackPosition: SnackPosition.BOTTOM);

    isProcessing.value = false;
  }
}
