import 'dart:io';
import 'package:final_main_project/styles/button_style.dart';
import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:final_main_project/widget/age/predict_button.dart';
import 'package:final_main_project/widget/age/upload_image_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget answerAreaWidget(BuildContext context) {
  final vm = Get.find<AgeVM>();

  return Obx(() {
    if (vm.faceImage.value != null && vm.cropResponeCode.value != -1 &&  vm.croppedFaceImage.value != null) {
      // 얼굴 인식 결과가 있을 때
      return Padding(
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
              width: 210.w,
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.only(right: 80.0, bottom: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('얼굴 인식 결과에요!'),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 100.h,
                    width: 250.w,
                    child: Image.file(File(vm.croppedFaceImage.value!.path)),
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: Row(
                      children: [
                        uploadImageButton(
                          context,
                          '재업로드',
                          secondaryButtonStyle(context),
                          vm,
                        ),
                        SizedBox(width: 3.w),
                        predictButton(
                          context,
                          primaryButtonStyle(context),
                          vm,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5.w),
                ],
              ),
            ),
          ],
        ),
      );
    } else if (vm.cropResponeCode.value == 500) {
      // 얼굴 인식 실패 시
      return Padding(
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
              width: 220.w,
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.only(right: 80.0, bottom: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('아쉽지만 얼굴을 인식하지 못했어요. 사진을 다시 올려주세요.'),
                  SizedBox(height: 10.h),
                  Center(
                    child: uploadImageButton(
                      context,
                      '재업로드',
                      secondaryButtonStyle(context),
                      vm,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else if (vm.cropResponeCode.value == -1) {
      // 얼굴 인식 중일 때
      return Padding(
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
              width: 120.w,
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.only(right: 80.0, bottom: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text('얼굴 인식 중......'),
            ),
          ],
        ),
      );
    } else { 
      // 기본 상태일 때
      return Container();
    }
  });
}
