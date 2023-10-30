import 'package:final_main_project/view/tabbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FriendDetailSheet extends StatelessWidget {
  final String name;
  final String imagePath; // AI의 이미지 경로
  final String coverImagePath; // 배경 커버 이미지 경로
  final String description; // 설명 텍스트
  final String statusMessage; // 상태 메세지
  final int tabbar_index; // 갈 페이지 index
  final String text; // 문구
  final String model; // 학습된 모델 이름
  final String data; // 학습된 데이터 수

  FriendDetailSheet({
    required this.name,
    required this.imagePath,
    required this.coverImagePath,
    required this.description,
    required this.statusMessage,
    required this.tabbar_index,
    required this.text,
    required this.model,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(coverImagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5), // 어두운 레이어의 투명도 조절
            BlendMode.darken, // 어둡게 만드는 블렌드 모드
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 30.h,
            left: 15.h,
            child: Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                shape: BoxShape.circle, // 원형의 테두리를 생성
                border:
                    Border.all(color: Colors.white, width: 2.0), // 흰색 테두리 추가
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  size: 20,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 400.h,
              ),
              // AI의 사진
              CircleAvatar(
                backgroundImage: AssetImage(imagePath),
                radius: 50.0,
                backgroundColor: Colors.white,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                statusMessage,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.chat),
                            onPressed: () {
                              Navigator.pop(context); // 바텀시트 닫기
                              Get.offAll(() => const TabBarScreen(),
                                  arguments: tabbar_index);
                            },
                            iconSize: 30,
                            color: Colors.white,
                          ),
                          Text(
                            text,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40.h,
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Image.asset(
                              'assets/images/insta.png',
                              scale: 10,
                            ),
                            onPressed: () {
                              Navigator.pop(context); // 바텀시트 닫기
                            },
                            iconSize: 30,
                            color: Colors.white,
                          ),
                          const Text(
                            '인스타그램',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              // Expanded(child: SizedBox()), // 이 부분을 추가하여 아래의 Row를 화면 하단으로 밀어냅니다.
              const Spacer(), // 이 부분을 추가하여 아래의 Row를 화면 하단으로 밀어냅니다.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        model,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        '학습 모델 📝',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "$data개",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        '학습 데이터',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              )
            ],
          ),
        ],
      ),
    );
  }
}
