import 'package:final_main_project/view/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget paymentWidget() {
  return InkWell(
    onTap: () {
      // 페이지 전환
      Get.to(const PaymentPage());
    },
    child: SizedBox(
      width: 320.w,
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/payment.png'),
              ),
            ),
          ),
          const Text(
            '등록카드',
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
