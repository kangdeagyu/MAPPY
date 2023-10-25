import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_main_project/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPageVM extends GetxController {
  //property
  late TextEditingController uidController;
  late TextEditingController upasswordController;
  late TextEditingController upasswordController2;
  late TextEditingController unameController;
  late TextEditingController uinsertdateController;

  // firebase에서 가져온 데이터 담아놓을 변수
  String ids = ""; // shared pref
  String docID = "";  // docID
  String uid = ""; 
  String upassword = "";  
  String uname = "";  
  String ubirth = "";  
  String uinsertdate = "";  


  // 비밀번호확인
  late String passCheck;

  @override
  void onInit() {
    super.onInit();
    // share pref 로 값 받아서 id에 값 넣어주기
    initSharedPreferences().then((_) {
      selectFirebase().then((_){
        initValueTF();
      });
    });

    // onInit에서 초기화 작업을 수행할 수도 있습니다.
    uidController = TextEditingController(text: ids);
    upasswordController = TextEditingController(text: upassword);
    upasswordController2 = TextEditingController(text: upassword);
    unameController = TextEditingController(text: uname);
    uinsertdateController = TextEditingController(text: uinsertdate);

    passCheck = "";
  }

  // MyPageVM() {
  //   // 생성자에서 initSharedPreferences 함수 호출

  // initSharedPreferences();
  // }

  // Shared Preferneces  로 받아온 아이디값으로 유저정보보여주기위해 아이디 받아옴
  initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("p_userId")!; // null check
    ids = userId;
    update();
  }

  //비번 일치불일치
  passwordCheck() {
    upasswordController.text.trim() == upasswordController2.text.trim()
        ? passCheck = "일치"
        : passCheck = "불일치";

    print("확인은?${passCheck}");
    update();
  }

// 텍스트필드에 초기값 넣어주기
  initValueTF() async {
    uidController.text = ids;
    upasswordController.text = upassword;
    upasswordController.text = upassword;
    unameController.text = uname;
    uinsertdateController.text = uinsertdate;
    update();
  }

  // Firebase select
  Future<void> selectFirebase() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("user")
        .where("uid", isEqualTo: "wook")
        .get();
    docID = querySnapshot.docs[0].reference.id;
    User user = User(
        uid: querySnapshot.docs[0]["uid"],
        upassword: querySnapshot.docs[0]["upassword"],
        uname: querySnapshot.docs[0]["uname"],
        ubirth: querySnapshot.docs[0]["ubirth"],
        dateTime: querySnapshot.docs[0]["uinsertdate"]);
    print(user.uname);
    uid = user.uid;
    upassword = user.upassword;
    uname = user.uname;
    ubirth = user.ubirth;
    // Timestamp => String 
    // Timestamp를 DateTime으로 변환
    Timestamp timestamp = user.dateTime;
    DateTime dateTime = timestamp.toDate();

    // DateTime을 String으로 포맷
    String formattedDateTime = dateTime.toLocal().toString();

    uinsertdate = formattedDateTime;

    update();
  }
}
