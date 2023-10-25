// widget register form
// ignore: must_be_immutable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_main_project/viewmodel/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RegistrationPage extends StatelessWidget {
  final String labelText;
  final String hintText;
  final VoidCallback nextPage;
  final VoidCallback previousPage;
  late Future<bool> dup;
  


  RegistrationPage({
    required this.labelText,
    required this.hintText,
    required this.nextPage,
    required this.previousPage,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(VisibleController()); //controller등록
    return GetBuilder<VisibleController>(
      builder: (controller) {
        return Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            SizedBox(
              width: 340.w,
              //height: 200.h,
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: controller.textEditingController,
                decoration: InputDecoration(
                  labelText: labelText,
                  hintText: hintText,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10.h, 10.w, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(
                    visible: controller.counter == 1 ? false : true,
                    child: ElevatedButton(
                      onPressed: () {
                        previousPage();
                        controller.decrease();
                        controller.infoList.removeLast();
                        // textfield 초기화
                        controller.textEditingController.text = "";
                        print(controller.infoList);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF4081),
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "이전",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.counter == 4) {
                        controller.infoList.add(
                                  controller.textEditingController.text.trim());
                        insertActionFirebase(controller);
                      } else {
                        if (controller.counter == 1) {
                          dupcheck(controller).then((dup) {
                            if (dup) {
                              controller.increase();
                              // infoList에 textfield 값 넣어두기
                              controller.infoList.add(
                                  controller.textEditingController.text.trim());
                              nextPage();
                              // textfield 초기화
                              controller.textEditingController.text = "";
                              print(controller.infoList);
                            } else {
                              controller.counter = 1;
                              // 중복에러
                              Message_wook.errorID? snackBarID() : snackBarFunction();
                            }
                          });
                        } else {
                          controller.increase();
                          // infoList에 textfield 값 넣어두기
                          controller.infoList.add(
                              controller.textEditingController.text.trim());
                          // 다음 페이지뷰로 이동
                          nextPage();
                          // textfield 초기화
                          controller.textEditingController.text = "";
                          print(controller.infoList);
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF4081),
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      controller.counter == 4 ? "회원가입" : "다음",
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

// functions

//  Alert ------------------------------------------------------

//중복메세지 스낵바
snackBarFunction() {
  Get.snackbar(
      "", // title
      "중복된 아이디 입니다.", // content
      snackPosition: SnackPosition.BOTTOM, // 스낵바위치
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red,
      colorText: Colors.white);
}
//아이디입력 스낵바
snackBarID() {
  Get.snackbar(
      "", // title
      "아이디를 입력해 주세요", // content
      snackPosition: SnackPosition.BOTTOM, // 스낵바위치
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red,
      colorText: Colors.white);
}

//아이디 사용가능 스낵바
snackBarsFunction() {
  Get.snackbar(
      "", // title
      "사용가능한 입니다.", // content
      snackPosition: SnackPosition.BOTTOM, // 스낵바위치
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.green,
      colorText: Colors.white);
}

// 회원정보를 받아서 가입승인 alert
_showDialog(VisibleController controller) {
  Get.defaultDialog(
    title: "회원가입완료",
    middleText:
        " ${controller.infoList[2]}님의 가입을 축하드립니다 !\n회원가입 이벤트 100코인이 지급됩니다.",
    backgroundColor: Colors.white,
    barrierDismissible: false,
    actions: [
      TextButton(
        onPressed: () {
          Get.back();
          Get.back();
        },
        child: const Text(
          "OK",
        ),
      ),
    ],
  );
}

errorSnackBar() {
  Get.snackbar(
      "회원가입실패", // title
      "정보를 확인해주세요", // content
      snackPosition: SnackPosition.BOTTOM, // 스낵바위치
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red,
      colorText: Colors.white);
}

// 파이어베이스 DB에 user 정보 추가
insertActionFirebase(VisibleController controller) {
  if (controller.counter == 4 && 
  controller.infoList[1].isNotEmpty &&
  controller.infoList[2].isNotEmpty &&
  controller.infoList[3].isNotEmpty ) {
    // 현재 시간 생성
    Timestamp now = Timestamp.now();
    FirebaseFirestore.instance.collection("user").add({
      "uid": controller.infoList[0],
      "upassword": controller.infoList[1],
      "uname": controller.infoList[2],
      "ubirth": controller.infoList[3],
      "uinsertdate": now,
      "udeleted": 0,
      "coin": 100,
    });
    _showDialog(controller);
  } else {
    errorSnackBar();
  }
}

// 파이어베이스 DB에서 아이디 중복체크하기
Future<bool> dupcheck(VisibleController controller) async {
  bool rs = false;
  if (controller.textEditingController.text.trim().isNotEmpty){
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("user")
        .where("uid", isEqualTo: controller.textEditingController.text.trim())
        .get();
    int count = querySnapshot.size; // 문서 개수 세기
    // 아이디가 중복이있으면 중복메세지한 후 false 값 리턴
    if (count >= 1) {
      //중복일때  Message_wook.errorID = false;
      rs = false;
      Message_wook.errorID = false;
    }else{
      rs= true;
    }
  }else{
    // 아이디 비었을때 Message_wook.errorID = true;
    Message_wook.errorID = true;
  }
    // 아이디 사용가능하면 true리턴
    return rs;


}




class Message_wook{
  static bool errorID = false;

}