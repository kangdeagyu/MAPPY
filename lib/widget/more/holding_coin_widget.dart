import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget holdingCoin(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        width: 340.w,
        height: 30.h,
        child: Text(
          '현재 보유 코인',
          style: TextStyle(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 36.w,
            height: 36.h,
            child: const Icon(
              Icons.monetization_on,
              color: Colors.green,
            ),
          ),
          Text(
            '0',
            style: TextStyle(
              color: Theme.of(context).colorScheme.background,
              fontSize: 20,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ],
      ),
    ],
  );
}
