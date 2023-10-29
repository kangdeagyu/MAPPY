import 'package:final_main_project/view/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget userpage(context) {
  return InkWell(
    onTap: () {
      Get.to(const UserPage());
    },
    child: SizedBox(
      width: 320.w,
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '나의 프로필',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 20,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    ),
  );
}
