import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_main_project/view/register.dart';
import 'package:final_main_project/view/tabbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginVM extends GetxController {
  // property
  late TextEditingController uidController;
  late TextEditingController upasswordController;
  bool passwordVisible = false;
  int deleted = 0;

  @override
  void onInit() {
    super.onInit();
    // share pref 로 값 받아서 id에 값 넣어주기
    // initSharedPreferences().then((_) {
    //   selectFirebase().then((_) {
    //     initValueTF();
    //   });
    uidController = TextEditingController();
    upasswordController = TextEditingController();
  }


  // 비밀번호 보이기 안보이기
  transPW() {
    passwordVisible = !passwordVisible;
    update();
  }




// ==================================== functions ====================================

  kakao() async {
    // 카카오 로그인 구현 예제

// 카카오톡 실행 가능 여부 확인
// 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공');
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          await UserApi.instance.loginWithKakaoAccount();
          print('카카오계정으로 로그인 성공');
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공');
        User user = await UserApi.instance.me();
        print('사용자 정보 요청 성공'
            '\n회원번호: ${user.id}'
            '\n이메일: ${user.kakaoAccount?.email}');

        //  이메일이 회원가입이 되어있는지 아닌지 확인하기
        Future<int> rsNum = kakaoidCheck(user.kakaoAccount?.email);
        int rs = await rsNum;
        print("중복은${rs}");
        if (rs == 1) {
          //_showDialog();
          ksaveSharedPreferences(user.kakaoAccount?.email);
          Get.to(const TabBarScreen());
        } else {
          // 회원가입페이지로 이동
          kakaoRegisterCheck();
        }
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
  }

// 파이어베이스 DB에서 카카오아이디 중복체크하기
  Future<int> kakaoidCheck(String? id) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("user")
        .where("uid", isEqualTo: id)
        .where("udeleted", isEqualTo: 0)
        .get();
    int count = querySnapshot.size; // 문서 개수 세기
    return count;
  }

// 파이어베이스 DB에서 아이디 중복체크하기
  Future<int> loginCheck(String id, String pw) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("user")
        .where("uid", isEqualTo: id)
        .where("upassword", isEqualTo: pw)
        .where("udeleted", isEqualTo: 0)
        .get();
    int count = querySnapshot.size; // 문서 개수 세기
    return count;
  }

// Firebase select
  Future<void> selectFirebase() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("user")
        .where("uid", isEqualTo: uidController.text.trim())
        .get();
    if(querySnapshot.size>0){
      deleted = querySnapshot.docs[0]["udeleted"] ?? 0;
    }else{
      print("아이디없음");
    }
    update();
  }

// ===============================================================Alert =====================================================
// 아이디 비번이 일치하지 않을때
  FailAlert() {
    Get.defaultDialog(
      title: "로그인실패",
      middleText: "계정과 비밀번호를 확인해주세요",
      barrierDismissible: false,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text(
                "OK",
              ),
            ),
          ],
        ),
      ],
    );
  }

// 탈퇴된회원
  FailAlert2() {
    Get.defaultDialog(
      title: "로그인실패",
      middleText: "탈퇴된 계정입니다.",
      barrierDismissible: false,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text(
                "OK",
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 카카오 계정이 회원가입되어있지 않을때
  kakaoRegisterCheck() {
    Get.defaultDialog(
      title: "",
      middleText: "회원가입을 진행하시겠습니까?.",
      barrierDismissible: false,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    "아니오",
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(const Register())?.then((_) => Get.back());
                  },
                  child: const Text(
                    "예",
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  // ====================================Shared Preferneces=============================================

  initSharedPreferences() async {
    // shared preference 인스턴스 생성
    final Future<SharedPreferences> preference =
        SharedPreferences.getInstance();
    final SharedPreferences prefs = await preference;

    uidController.text = prefs.getString("p_userId") ?? ""; // null 이면 빈문자를 넣는다.
    //pw.text = prefs.getString("p_password") ?? "";

    // 메모리에 결과값이 남아있는지 테스트
    // 앱을 종료하고 다시 실행하면 Shared Preference에 남아 있으므로
    // 앱을 종료시 정리하여야 한다.
  }

  saveSharedPreferences() async {
    // ID PW 를 저장함
    final prefernece = await SharedPreferences.getInstance();
    prefernece.setString("p_userId", uidController.text.trim());
    //prefernece.setString("p_password", pw.text.trim());
  }

  ksaveSharedPreferences(String? id) async {
    // ID PW 를 저장함
    final prefernece = await SharedPreferences.getInstance();
    prefernece.setString("p_userId", id!);
  }

  disposeSharedPreferences() async {
    // 저장된 ID PW를 지우기
    final prefernece = await SharedPreferences.getInstance();
    prefernece.clear();
  }

} // end
