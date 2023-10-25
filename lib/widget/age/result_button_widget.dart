import 'package:final_main_project/styles/button_style.dart';
import 'package:final_main_project/styles/text_style.dart';
import 'package:final_main_project/components/age/age_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget resultButtonWidget(context, coin) {


  return ElevatedButton(
    style: secondaryButtonStyle(context),
    onPressed: () {
      if (coin >= 30) {
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
                onPressed: () {
                  Get.back();
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
  );
}
