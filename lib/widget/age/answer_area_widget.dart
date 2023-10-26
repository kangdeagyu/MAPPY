import 'dart:io';
import 'package:final_main_project/styles/button_style.dart';
import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:final_main_project/widget/age/predict_button.dart';
import 'package:final_main_project/widget/age/upload_image_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget answerAreaWidget(context) {
  final vm = Get.find<AgeVM>();

  return Obx(() => vm.croppedFaceImage.value != null &&
          vm.faceImage.value != null // 이미지가 null이 아니면
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
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 100.h,
                      width: 250.w,
                      child: Image.file(File(vm.croppedFaceImage.value!
                          .path)), // show image on screen
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: Row(
                        children: [
                          uploadImageButton(context, '재업로드', secondaryButtonStyle(context), vm),
                          SizedBox(width: 3.w,),
                          predictButton(context, primaryButtonStyle(context), vm),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ////////////// 얼굴 인식 못 했을 경우
      : vm.croppedFaceImage.value == null && vm.faceImage.value != null
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
                        const Text('아쉽지만 얼굴을 인식하지 못했어요.\n사진을 다시 올려주세요.'),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                          child: uploadImageButton(context, '재업로드', secondaryButtonStyle(context), vm),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Container());
}
