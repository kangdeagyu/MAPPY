import 'package:final_main_project/components/more/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget paymentWidget(BuildContext context) {
  return InkWell(
    onTap: () {
      // 페이지 전환
      Get.to(const PaymentPage());
    },
    child: SizedBox(
      width: 320.w,
      height: 30.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '등록카드',
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
