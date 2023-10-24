import 'package:final_main_project/styles/button_style.dart';
import 'package:final_main_project/view/age_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget resultButtonWidget(BuildContext context) {
  return ElevatedButton(
    style: secondaryButtonStyle(context),
    onPressed: () {
      Get.dialog(
        AlertDialog(
          title: Row(
              children: [
                Image.asset(
                  'assets/images/yena_crop.png',
                  height: 70.h,
                ),
                SizedBox(width: 10.w,),
                const Text(
                  '30코인을 사용해서\n결과를 확인하시겠어요?',
                  style: TextStyle(fontSize: 18),
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
    },
    child: Padding(
      padding: EdgeInsets.fromLTRB(5.w, 10.h, 5.w, 10.h),
      child: Column(
        children: [
          const Text(
            '결과 확인하기',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          SizedBox(
            width: 100.w,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.monetization_on,
                  color: Colors.green,
                  size: 25,
                ),
                Text(
                  ' 30',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
