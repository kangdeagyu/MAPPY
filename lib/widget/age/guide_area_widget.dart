import 'package:final_main_project/styles/button_style.dart';
import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:final_main_project/widget/age/upload_image_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget guideAreaWidget(BuildContext context) {
  final vm = Get.find<AgeVM>();

  return Obx(() => vm.displayGuide2.value
      ? Row(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/Age_Icon.png'),
              backgroundColor: Colors.white,
              radius: 20,
            ),
            SizedBox(width: 8.w),
            Container(
              width: 150.w,
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.only(right: 80.0, bottom: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      '정면 사진을 올려주셔야 확인이 가능해요.'),
                  SizedBox(height: 5.h,),
                  uploadImageButton(context, '이미지 업로드', primaryButtonStyle(context), vm),
                ],
              ),
            ),
          ],
        )
      : const SizedBox());
}
