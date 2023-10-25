import 'package:final_main_project/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget logOut() {
  return InkWell(
    onTap: () {
      Get.offAll(const LoginScreen());
    },
    child: SizedBox(
      width: 350.w,
      height: 30.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 36.w,
            height: 36.h,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logout.png'),
              ),
            ),
          ),
          const Text(
            'Logout',
            style: TextStyle(
              color: Color(0xFF2F9BFF),
              fontSize: 20,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ],
      ),
    ),
  );
}
