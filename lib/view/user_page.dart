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
                      labelText: "아이디",
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
                      labelText: "가입날짜",
                    ),
                    readOnly: true,
                  ),
                ),
                Text(
                  "비밀번호 ${Get.find<MyPageVM>().passCheck}",
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
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(128, 255, 64, 128), // 버튼 배경색
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
                        print("Elevated Button");
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
}
