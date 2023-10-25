import 'package:final_main_project/components/age/age_result.dart';
import 'package:final_main_project/components/more/charge_components.dart';
import 'package:final_main_project/styles/button_style.dart';
import 'package:final_main_project/styles/text_style.dart';
import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget answerAreaWidget(context) {

  final vm = Get.find<AgeVM>();

  return Obx(() => vm.displayAnswer.value // 이미지가 null이 아니면
      ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/Age_Icon.png'),
                backgroundColor: Colors.white,
                radius: 20,
              ),
              const SizedBox(width: 8),
              Container(
                width: 150,
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(right: 80.0, bottom: 5.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text('결과를 확인해보세요!'),
                    SizedBox(
                      height: 10.h,
                    ),
                    ElevatedButton(
    style: secondaryButtonStyle(context),
    onPressed: () {
      if (vm.myCoin.toInt() >= 30) {
        Get.dialog(
          AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'assets/images/yena_crop.png',
                  height: 70.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  '30코인을 사용해서\n결과를 확인하시겠어요?',
                  style: onBackgroundTextStyle(context, 18),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('취소'),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                  vm.useCoin(30);
                  Get.to(const AgeResultScreen());
                },
                child: const Text('확인'),
              ),
            ],
          ),
        );
      } else {
        Get.dialog(
          AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'assets/images/yena_crop.png',
                  height: 70.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  '보유 코인이 부족해요!!\n충전하시겠어요?',
                  style: onBackgroundTextStyle(context, 18),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('취소'),
              ),
              TextButton(
                onPressed: () async{
                  Get.back();
                  Get.bottomSheet(
                    Container(
                      height: 600.h,
                      color: Colors.white,
                      child: const ChargeWidget(),
                    ),
                    isScrollControlled: true,
                  );
                },
                child: const Text('확인'),
              ),
            ],
          ),
        );
      }
    },
    child: Text(
      '확인하기',
      style: buttonTextStyle(context),
    ),
  ),
                  ],
                ),
              ),
            ],
          ),
        )
      : const SizedBox());
}
