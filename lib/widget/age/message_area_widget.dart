import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget messageAreaWidget(context, String content, double width, RxBool index) {

  return Obx(() => index.value
      ? Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/Age_Icon.png'),
              backgroundColor: Colors.white,
              radius: 20,
            ),
            SizedBox(width: 8.w),
            Container(
              width: width,
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.only(right: 80.0, bottom: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                  content),
            ),
          ],
        )
      : const SizedBox());
}
