import 'package:final_main_project/viewmodel/mypage_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyPageVM());
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'), // Appbar에 표시할 타이틀 텍스트
      ),
      body: GetBuilder<MyPageVM>(
        builder: (controller) {
          return Center(
            child: Column(
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    readOnly: true,
                    controller: Get.find<MyPageVM>().uidController,
                    decoration: const InputDecoration(
                      labelText: "계정",
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: Get.find<MyPageVM>().unameController,
                    decoration: const InputDecoration(
                      labelText: "이름을 입력하세요",
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: Get.find<MyPageVM>().upasswordController,
                    onChanged: (value) => Get.find<MyPageVM>().passwordCheck(),
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "비밀번호를 입력하세요",
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: Get.find<MyPageVM>().upasswordController2,
                    onChanged: (value) => Get.find<MyPageVM>().passwordCheck(),
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "비밀번호 확인",
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: Get.find<MyPageVM>().uinsertdateController,
                    decoration: const InputDecoration(
                      labelText: "회원가입 일자",
                    ),
                    readOnly: true,
                  ),
                ),
                Text(
                  Get.find<MyPageVM>().passCheck.isNotEmpty
                      ? "비밀번호 ${Get.find<MyPageVM>().passCheck}"
                      : "",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print("Elevated Button");
                        bool rs = Get.find<MyPageVM>().deleteFirebase();
                        if (rs){
                          deletesnackBarsFunction();
                        }else{
                          Get.find<MyPageVM>().showD();
                        }

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color.fromARGB(128, 255, 64, 128), // 버튼 배경색
                        foregroundColor: Colors.white, // 버튼 글씨색
                        shape: RoundedRectangleBorder(
                          //  버튼 모양 깎기
                          borderRadius: BorderRadius.circular(10), // 10은 파라미터
                        ),
                      ),
                      child: const Text(
                        "삭제",
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        var rs = Get.find<MyPageVM>().updateFirebase();
                        if (rs) {
                          _SuccessAlert();
                        } else {
                          _FailAlert();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF4081), // 버튼 배경색
                        foregroundColor: Colors.white, // 버튼 글씨색
                        shape: RoundedRectangleBorder(
                          //  버튼 모양 깎기
                          borderRadius: BorderRadius.circular(10), // 10은 파라미터
                        ),
                      ),
                      child: const Text(
                        "수정",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

// functions
//  비번이 일치하지 않을때
  _FailAlert() {
    Get.defaultDialog(
      title: "Fail",
      middleText: "회원정보를 확인해주세요",
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

  //  비번이 일치하지 않을때
  _SuccessAlert() {
    Get.defaultDialog(
      title: "Success",
      middleText: "수정이 완료되었습니다.\n다시 로그인 해주세요.",
      barrierDismissible: false,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Get.back();
                Get.back();
                Get.back();
              },
              child: const Text(
                "OK",
              ),
            ),
          ],
        ),
      ],
    );
  }
// 회원탈퇴시 
  deletesnackBarsFunction() {
    Get.defaultDialog(
      title: "",
      middleText: "탈퇴되었습니다.",
      barrierDismissible: false,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Get.back();
                Get.back();
                Get.back();
              },
              child: const Text(
                "OK",
              ),
            ),
          ],
        ),
      ],
    );
  }


}//end
