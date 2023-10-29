import 'package:final_main_project/model/aiProfile.dart';
import 'package:final_main_project/view/tabbar_screen.dart';
import 'package:final_main_project/widget/chat/friendDetailSheetWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<AIProfile> aiProfiles = [
    AIProfile(
        imagePath: 'assets/images/Chatbot_Icon.png',
        coverImage: 'assets/images/seah-cover.png',
        name: 'AI 세아',
        description: '심리 케어 서비스',
        model: 'Transformers',
        trainingData: '160,000',
        tabbar_index: 2,
        text: '세아와 대화하기',
      ),
    AIProfile(
        imagePath: 'assets/images/yena_crop.png',
        coverImage: 'assets/images/yena-cover.png',
        name: 'AI 예나',
        description: '연령 예측 서비스',
        model: 'GAN',
        trainingData: '8,000',
        tabbar_index: 1,
        text: '예나와 대화하기'
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            // CircleAvatar(
            //   backgroundImage: AssetImage('assets/images/Chatbot_Icon.png'),
            //   backgroundColor: Colors.white,
            //   radius: 20,
            // ),
            SizedBox(width: 8),
            Text(
              '친구들',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: aiProfiles.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              _showFriendDetailSheet(
                context,
                aiProfiles[index].name,
                aiProfiles[index].imagePath,
                aiProfiles[index].coverImage,
                aiProfiles[index].description,
                aiProfiles[index].description,
                aiProfiles[index].tabbar_index,
                aiProfiles[index].text
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(aiProfiles[index].imagePath),
                    backgroundColor: Colors.white,
                    radius: 20,
                  ),
                  SizedBox(width: 10), // 원하는 간격을 조절합니다.
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        aiProfiles[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        aiProfiles[index].description,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showFriendDetailSheet(BuildContext context, String name, String imagePath, String coverImagePath, String desc1, String desc2, int index, String text) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return FriendDetailSheet(
          name: name,
          imagePath: imagePath,
          coverImagePath: coverImagePath,
          description1: desc1,
          description2: desc2,
          tabbar_index: index,
          text: text,
        );
      },
      isScrollControlled: true, // 전체 화면을 사용하기 위해 true로 설정
    );
  }
}


