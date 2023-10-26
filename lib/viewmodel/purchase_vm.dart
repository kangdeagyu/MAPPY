import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PurchaseVM extends GetxController {
  var isProcessing = false.obs;
  var isComplete = false.obs;
  var uId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserID();
  }

  // 유저 아이디 들고오기
  Future<void> loadUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uId.value = prefs.getString("p_userId") ?? '';
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> updateCoin(int coin) async {
    String userid = uId.value;

    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('user')
          .where('uid', isEqualTo: userid)
          .get();

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
    isProcessing.value = false;

    isComplete.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    await updateCoin(coin);

    Get.back();
    Get.back();
    isComplete.value = false;
  }

  // 결재 내역 등록
  Future<void> insertHistory(int coin, String cardNum, int price) async {
    String userId = uId.value;

    // 'chat' 컬렉션 참조
    CollectionReference chat = FirebaseFirestore.instance.collection('chat');

    // 'userid'를 문서로 사용
    DocumentReference userDoc = chat.doc(userId);

    // 해당 'userid' 문서 아래의 'payments' 컬렉션 참조
    CollectionReference payments = userDoc.collection('payment');

    // 'messages' 컬렉션에 채팅 내용 추가
    await payments.add({
      'cardNumber': cardNum, // 카드번호
      'coin': coin,
      'price': price, // 충전이든 사용이든 여기에 넣어주기.
      'usedate': Timestamp.fromDate(DateTime.now())
    });
  }
}
