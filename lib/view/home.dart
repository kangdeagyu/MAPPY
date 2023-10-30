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
      statusMessage: '세상을 더 아름답게 🌈',
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
        statusMessage: '사진 분석 전문가! 😎',
        model: 'GAN',
        trainingData: '8,000',
        tabbar_index: 1,
        text: '예나와 대화하기'),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    _showFriendDetailSheet(
                      context,
                      aiProfiles[index].name,
                      aiProfiles[index].imagePath,
                      aiProfiles[index].coverImage,
                      aiProfiles[index].description,
                      aiProfiles[index].statusMessage,
                      aiProfiles[index].tabbar_index,
                      aiProfiles[index].text,
                      aiProfiles[index].model,
                      aiProfiles[index].trainingData,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage(aiProfiles[index].imagePath),
                          backgroundColor: Colors.white,
                          radius: 20,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                aiProfiles[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              Text(
                                aiProfiles[index].description,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(), // 여기에 Spacer를 추가
                        IconButton(
                          icon: Image.asset(
                            'assets/images/insta.png',
                            scale: 15,
                          ),
                          onPressed: () {},
                          iconSize: 10,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                if (index != aiProfiles.length - 1)
                  Divider(
                    height: 1.0,
                    color: Colors.grey[200],
                  ), // 마지막 항목이 아닐 때만 Divider 추가
              ],
            );
          },
        ),
      ),
    );
  }

  void _showFriendDetailSheet(
      BuildContext context,
      String name,
      String imagePath,
      String coverImagePath,
      String desc,
      String status,
      int index,
      String text,
      String model,
      String data) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return FriendDetailSheet(
          name: name,
          imagePath: imagePath,
          description: desc,
          statusMessage: status,
          coverImagePath: coverImagePath,
          tabbar_index: index,
          text: text,
          model: model,
          data: data,
        );
      },
      isScrollControlled: true, // 전체 화면을 사용하기 위해 true로 설정
    );
  }
}
