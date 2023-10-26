import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:final_main_project/widget/age/answer_area_widget.dart';
import 'package:final_main_project/widget/age/message_area_widget.dart';
import 'package:final_main_project/widget/age/photo_area_widget.dart';
import 'package:final_main_project/widget/age/guide_area_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AgePrediction extends StatelessWidget {
  AgePrediction({super.key});

  final vm = Get.put(AgeVM());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
    vm.resetResults();
    });


    return Scaffold(
      appBar: AppBar(
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
        actions: [
          const Icon(
            Icons.monetization_on,
            color: Colors.green,
            size: 25,
          ),
          const SizedBox(
            width: 5,
          ),
          Obx(() { // 코인 변화 rx로 실시간관리
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
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Obx(() => 
              messageAreaWidget(
                context, '안녕하세요 ${vm.userName}님!', 130.w, vm.displayGreeting)
            ),
            SizedBox(
              height: 5.h,
            ),
            Obx(() => 
              messageAreaWidget(
                context,
                '${vm.userName}님의 얼굴 나이를 예측해보세요!\n10대에서 70대까지 확인 가능!!!',
                220.w,
                vm.displayGuide1),
            ),
            SizedBox(
              height: 5.h,
            ),
            guideAreaWidget(context),
            Padding(
              padding: EdgeInsets.all(5.0.h),
              child: Align(
                alignment: Alignment.centerRight,
                child: photoAreaWidget(),
              ),
            ),
            answerAreaWidget(context),
          ],
        ),
      ),
    );
  }
}
