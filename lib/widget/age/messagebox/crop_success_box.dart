import 'dart:io';

import 'package:final_main_project/styles/button_style.dart';
import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:final_main_project/widget/age/button/predict_button.dart';
import 'package:final_main_project/widget/age/button/upload_image_button.dart';
import 'package:final_main_project/widget/age/messagebox/custom_message_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget cropSuccessBox(context) {
  final vm = Get.find<AgeVM>();

  return customMessageBox(
    maxWidth: 280.h,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('얼굴 인식 결과에요!! 맞으신가요?'),
        SizedBox(height: 10.h),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 170.h),
          child: Row(
            children: [
              SizedBox(
                height: 80.h,
                width: 80.w,
                child: Image.file(File(vm.croppedFaceImage.value!.path)),
              ),
              SizedBox(
                width: 15.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  uploadImageButton(
                    context,
                    '재업로드',
                    secondaryButtonStyle(context),
                  ),
                  SizedBox(width: 3.h),
                  predictButton(
                    // 예측하기 버튼
                    context,
                    primaryButtonStyle(context),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
      ],
    ),
  );
}
