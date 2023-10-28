import 'package:final_main_project/view/age_result.dart';
import 'package:final_main_project/components/more/charge_components.dart';
import 'package:final_main_project/styles/text_style.dart';
import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget predictButton(context, buttonStyle) {

  final vm = Get.find<AgeVM>();

  return ElevatedButton(
    style: buttonStyle,
    onPressed: () {
      if (vm.myCoin.value.toInt() >= 30) {
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
                  style: onBackgroundTextStyle(context, 16),
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
                  vm.sendFaceImage();
                  vm.insertHistory();
                  vm.resetResults();
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
                onPressed: () async {
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
      '예측하기',
      style: buttonTextStyle(context),
    ),
  );
}
