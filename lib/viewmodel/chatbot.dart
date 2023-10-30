import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Chatbot extends GetxController {
  // var id;
  // String userid;
  // String content;
  // String insertdate;

  RxInt myCoin = 0.obs; // 실시간 관리 위해 obs 사용

  @override
  void onInit() {
    super.onInit();
    loadUserID();
    checkCoin();
  }

  // Chatbot(
  //   {
  //     required this.id,
  //     required this.userid,
  //     required this.content,
  //     required this.insertdate
  //   }
  // );

  // 유저 아이디 들고오기
  Future<String> loadUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("p_userId")!;
    return userId;
  }

  //보유 코인 개수 가져오기
  Future<void> checkCoin() async {
    try {
      String userId = await loadUserID();
      FirebaseFirestore.instance
          .collection("user")
          .where("uid", isEqualTo: userId)
          .snapshots()
          .listen((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          myCoin.value = querySnapshot.docs[0]['coin'];
        }
      });
    } catch (error) {
      // print("코인 가져오기 오류: $error");
    }
  }

  // 코인 차감.
  Future<void> useCoin(int price) async {
    try {
      String userId = await loadUserID();

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("user")
          .where("uid", isEqualTo: userId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        int currentCoin = querySnapshot.docs[0]['coin'];
        int newCoin = currentCoin - price;
        // 업데이트
        querySnapshot.docs.first.reference.update({
          'coin': newCoin,
        });
      }
    } catch (error) {
      // print("코인 수정 오류: $error");
    }
  }

  Future<void> insertHistory() async {
    String userId = await loadUserID();

    // 'chat' 컬렉션 참조
    CollectionReference chat = FirebaseFirestore.instance.collection('chat');

    // 'userid'를 문서로 사용
    DocumentReference userDoc = chat.doc(userId);

    // 해당 'userid' 문서 아래의 'history' 컬렉션 참조
    CollectionReference historys = userDoc.collection('history');

    // 'messages' 컬렉션에 채팅 내용 추가
    await historys.add({
      'category': 'seah', // 'yena' or 'seah' or 'charge'
      'price': 10, // 충전이든 사용이든 여기에 넣어주기.
      'coinHistory': myCoin.value - 10,
      'usedate': Timestamp.fromDate(DateTime.now())
    });
  }
}
