import 'package:final_main_project/view/login.dart';
import 'package:final_main_project/viewmodel/card_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget logOut(context) {
  final cardVm = Get.put(CardVm());
  return InkWell(
    onTap: () {
      Get.offAll(const LoginScreen());
      cardVm.logout();
    },
    child: SizedBox(
      width: 320.w,
      height: 30.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '로그아웃',
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
