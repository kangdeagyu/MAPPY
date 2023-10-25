import 'package:final_main_project/viewmodel/mypage_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    initSharedPreferences();
    Get.put(MyPageVM());
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'), // Appbar에 표시할 타이틀 텍스트
      ),
      body: GetBuilder<MyPageVM>(
        builder: (controller) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${controller.id}",
                ),
              ],
            ),
          );
        },
      ),
    );
  }

// functions
  // Shared Preferneces  로 받아온 아이디값으로 유저정보보여주기위해 아이디 받아옴
  initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("p_userId")!; // null check
    print(userId);
    Get.find<MyPageVM>().id = userId;
  }
}
