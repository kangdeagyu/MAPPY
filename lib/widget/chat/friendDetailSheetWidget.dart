import 'package:final_main_project/view/tabbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendDetailSheet extends StatelessWidget {
  final String name;
  final String imagePath; // AI의 이미지 경로
  final String coverImagePath; // 배경 커버 이미지 경로
  final String description1; // 설명 텍스트 1
  final String description2; // 설명 텍스트 2
  final int tabbar_index; // 갈 페이지 index
  final String text; // 문구

  FriendDetailSheet({
    required this.name,
    required this.imagePath,
    required this.coverImagePath,
    required this.description1,
    required this.description2,
    required this.tabbar_index,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(coverImagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          // AppBar(title: Text('$name의 프로필'), automaticallyImplyLeading: false),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // AI의 사진
                  CircleAvatar(
                    backgroundImage: AssetImage(imagePath),
                    radius: 50.0,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.start),
                        onPressed: () {
                          Navigator.pop(context); // 바텀시트 닫기
                          print(tabbar_index);
                          Get.offAll(() => const TabBarScreen(), arguments: tabbar_index);
                        },
                        iconSize: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // 설명 텍스트 1
                  Text(
                    description1,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  // 설명 텍스트 2
                  Text(
                    description2,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
