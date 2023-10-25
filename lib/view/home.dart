import 'package:final_main_project/view/age_prediction.dart';
import 'package:final_main_project/view/chatbot_page.dart';
import 'package:final_main_project/view/tabbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 300,
              ),
              Text(
                "챗봇서비스",
              ),
              SizedBox(
                width: 320.w,
                child: Divider(
                  // 줄 긋기
                  height: 15.h, // 줄이 차지하는 크기
                  color: const Color.fromARGB(255, 38, 29, 29), // 색상
                  thickness: 2, // 줄 두께
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6.0.h),
                child: ElevatedButton(
                  onPressed: () => Get.offAll(const TabBarScreen(), arguments: 2),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      //  버튼 모양 깎기
                      borderRadius: BorderRadius.circular(30), // 10은 파라미터
                    ),
                    backgroundColor: Colors.pinkAccent,
                    minimumSize: const Size(200, 150),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/Chatbot_Icon.png",
                              width: 120.w,
                              height: 120.h,
                              fit: BoxFit.fill,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0.h),
                              child: const Text(
                                "안녕하세요! 세나입니다.\n 저는 챗봇서비스를 제공해요",
                                style: TextStyle(
                                  // 글씨 스타일주기
                                  color: Colors.white, // 글씨 색상
                                  fontSize: 15, // 글씨 크기
                                  fontWeight: FontWeight.bold, // 폰트 사이즈
                                  letterSpacing: 3, // 글자 간 간격
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                "연령예측 서비스",
              ),
              SizedBox(
                width: 320.w,
                child: Divider(
                  // 줄 긋기
                  height: 15.h, // 줄이 차지하는 크기
                  color: const Color.fromARGB(255, 38, 29, 29), // 색상
                  thickness: 2, // 줄 두께
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6.0.h),
                child: ElevatedButton(
                  onPressed: () => Get.offAll(const TabBarScreen(), arguments: 1),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      //  버튼 모양 깎기
                      borderRadius: BorderRadius.circular(30), // 10은 파라미터
                    ),
                    backgroundColor: Colors.lightGreen,
                    minimumSize: const Size(200, 150),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/Age_Icon.png",
                              width: 120.w,
                              height: 120.h,
                              fit: BoxFit.fill,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0.h),
                              child: const Text(
                                "안녕하세요! 예나입니다.\n저는 연령예측서비스를 제공해요",
                                style: TextStyle(
                                  // 글씨 스타일주기
                                  color: Colors.white, // 글씨 색상
                                  fontSize: 15, // 글씨 크기
                                  fontWeight: FontWeight.bold, // 폰트 사이즈
                                  letterSpacing: 3, // 글자 간 간격
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
