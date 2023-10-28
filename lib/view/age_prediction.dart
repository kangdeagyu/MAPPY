import 'package:final_main_project/styles/button_style.dart';
import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:final_main_project/widget/age/answer_widget.dart';
import 'package:final_main_project/widget/age/button/upload_image_button.dart';
import 'package:final_main_project/widget/age/messagebox/sequential_message_box.dart';
import 'package:final_main_project/widget/age/messagebox/photo_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AgePrediction extends StatelessWidget {
  AgePrediction({super.key});

  // viewmodel 생성
  final vm = Get.put(AgeVM());

  @override
  Widget build(BuildContext context) {
    // 탭 열릴 때마다 화면 초기화.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.resetResults();
    });

    return Scaffold(
      appBar: AppBar(
        // 뒤로가기 버튼 제거.
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/Age_Icon.png'),
              backgroundColor: Colors.white,
              radius: 20,
            ),
            SizedBox(width: 8),
            Text('예나'),
          ],
        ),
        // 현재 코인 관리
        actions: [
          const Icon(
            Icons.monetization_on,
            color: Colors.green,
            size: 25,
          ),
          const SizedBox(
            width: 5,
          ),
          Obx(() {
            return Text(
              '${vm.myCoin.value}',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            );
          }),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              sequentialMessageBox(
                index: 0,
                child: Text(
                  '안녕하세요 ${vm.userName}님!',
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              sequentialMessageBox(
                  index: 1,
                  child: Text(
                    '${vm.userName}님의 얼굴 나이를 예측해보세요!\n10대에서 70대까지 확인이 가능해요!',
                  )),
              SizedBox(
                height: 5.h,
              ),
              sequentialMessageBox(
                index: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('정면 사진을 올려주셔야\n확인이 가능해요.'),
                    SizedBox(
                      height: 5.h,
                    ),
                    uploadImageButton(
                        context, '이미지 업로드', primaryButtonStyle(context)),
                  ],
                ),
              ),
// 이미지 업로드 시 my message.
              Padding(
                padding: EdgeInsets.all(5.0.h),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: photoBox(),
                ),
              ),
// 예나 result message.
              answerWidget(context),
            ],
          ),
        ),
      ),
    );
  }
}
