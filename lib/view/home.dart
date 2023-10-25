import 'package:final_main_project/view/age_prediction.dart';
import 'package:final_main_project/view/chatbot_page.dart';
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
              Padding(
                padding: EdgeInsets.all(6.0.h),
                child: ElevatedButton(
                  onPressed: () => Get.to(ChatbotView()),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      //  버튼 모양 깎기
                      borderRadius: BorderRadius.circular(30), // 10은 파라미터
                    ),
                    backgroundColor: Colors.pinkAccent,
                    maximumSize: const Size(320, 320),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "안녕하세요! 저는 세나입니다.\n챗봇서비스를 제공해요",
                              style: TextStyle(
                                // 글씨 스타일주기
                                color: Colors.white, // 글씨 색상
                                fontSize: 15, // 글씨 크기
                                fontWeight: FontWeight.bold, // 폰트 사이즈
                                letterSpacing: 3, // 글자 간 간격
                              ),
                            ),
                          ),
                          Image.asset(
                            "assets/images/Chatbot_Icon.png",
                            width: 200.w,
                            height: 200.h,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6.0.h),
                child: ElevatedButton(
                  onPressed: () => AgePrediction(),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      //  버튼 모양 깎기
                      borderRadius: BorderRadius.circular(30), // 10은 파라미터
                    ),
                    backgroundColor: Colors.lightGreen,
                    maximumSize: const Size(320, 320),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "안녕하세요! 저는 예나입니다.\n연령예측서비스를 제공해요",
                              style: TextStyle(
                                // 글씨 스타일주기
                                color: Colors.white, // 글씨 색상
                                fontSize: 15, // 글씨 크기
                                fontWeight: FontWeight.bold, // 폰트 사이즈
                                letterSpacing: 3, // 글자 간 간격
                              ),
                            ),
                          ),
                          Image.asset(
                            "assets/images/Age_Icon.png",
                            width: 170.w,
                            height: 180.h,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ],
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
