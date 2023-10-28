import 'dart:io';

import 'package:final_main_project/styles/button_style.dart';
import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:final_main_project/widget/age/button/predict_button.dart';
import 'package:final_main_project/widget/age/button/upload_image_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget successCropBox (context){
  final vm = Get.find<AgeVM>();

  return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/Age_Icon.png'),
              backgroundColor: Colors.white,
              radius: 20,
            ),
            SizedBox(width: 5.w),
            Align(
                child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 280.h),
              child: Container(
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(bottom: 5.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('얼굴 인식 결과에요! 맞으신가요??'),
                    SizedBox(height: 10.h),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 180.h),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 80.h,
                            width: 80.w,
                            child:
                                Image.file(File(vm.croppedFaceImage.value!.path)),
                          ),
                          SizedBox(width: 10.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              uploadImageButton(
                                context,
                                '재업로드',
                                secondaryButtonStyle(context),
                                vm,
                              ),
                              SizedBox(width: 3.h),
                              predictButton( // 예측하기 버튼
                                context,
                                primaryButtonStyle(context),
                                vm,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            )),
          ],
        ),
      ); 
}