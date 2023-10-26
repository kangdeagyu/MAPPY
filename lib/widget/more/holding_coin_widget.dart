import 'package:final_main_project/viewmodel/chatbot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget holdingCoin(BuildContext context) {
  final vm = Get.put(Chatbot());
  return Column(
    children: [
      SizedBox(
        width: 340.w,
        height: 30.h,
        child: Text(
          '현재 보유 코인',
          style: TextStyle(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 36.w,
            height: 36.h,
            child: const Icon(
              Icons.monetization_on,
              color: Colors.green,
            ),
          ),
          Obx(
            () {
              // 코인 변화 rx로 실시간관리
              return Text(
                vm.myCoin.value.toString(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.background,
                  fontSize: 20,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
