import 'package:final_main_project/styles/button_style.dart';
import 'package:final_main_project/widget/age/button/upload_image_button.dart';
import 'package:final_main_project/widget/age/messagebox/custom_message_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget cropFailBox(context) {
  return customMessageBox(
    maxWidth: 210.w,
    child: Column(
      children: [
        const Text('아쉽지만 얼굴을 인식하지 못했어요.\n사진을 다시 올려주세요.'),
        SizedBox(height: 10.h),
        uploadImageButton(
          context,
          '재업로드',
          secondaryButtonStyle(context),
        ),
      ],
    ),
  );
}
