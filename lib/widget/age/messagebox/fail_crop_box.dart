import 'package:final_main_project/styles/button_style.dart';
import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:final_main_project/widget/age/button/upload_image_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget failCropBox (context) {

  final vm = Get.find<AgeVM>();

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
            Align(
                child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200.h),
              child: Container(
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(bottom: 5.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('아쉽지만 얼굴을 인식하지 못했어요.\n사진을 다시 올려주세요.'),
                    SizedBox(height: 10.h),
                    uploadImageButton(
                      context,
                      '재업로드',
                      secondaryButtonStyle(context),
                      vm,
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      );
}