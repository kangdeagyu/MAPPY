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

}