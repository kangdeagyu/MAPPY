import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:final_main_project/widget/age/result_button_widget.dart';
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
                    resultButtonWidget(context),
                  ],
                ),
              ),
            ],
          ),
        )
      : const SizedBox());
}
