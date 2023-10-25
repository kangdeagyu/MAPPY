import 'package:final_main_project/widget/more/coin_Charging_widget.dart';
import 'package:final_main_project/widget/more/etc_widget.dart';
import 'package:final_main_project/widget/more/holding_coin_widget.dart';
import 'package:final_main_project/widget/more/logout_widget.dart';
import 'package:final_main_project/widget/more/notification_widget.dart';
import 'package:final_main_project/widget/more/payment_widget.dart';
import 'package:final_main_project/widget/more/use_coin_widget.dart';
import 'package:final_main_project/widget/more/userpage_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 360.w,
              height: 160.h,
              color: Theme.of(context).colorScheme.onBackground,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  // 유저 코인 보유 사항
                  holdingCoin(context),
                  // 끝
                  SizedBox(
                    height: 20.h,
                  ),
                  // 유저 충전, 사용
                  Container(
                    width: 330.w,
                    height: 40.h,
                    color: Theme.of(context).colorScheme.background,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 충전하기
                        coinCharging(context),
                        // 사용 내역
                        useCoin(context)
                      ],
                    ),
                  ), // 유저 금액 내역끝
                ],
              ),
            ),
            // 유저기본정보 끝
            SizedBox(
              height: 30.h,
            ),
            // 유저 프로필
            userpage(),
            // 유저 프로필 끝
            SizedBox(
              height: 10.h,
            ),
            // 페이먼트
            paymentWidget(context),
            // 페이먼트 끝
            const SizedBox(
              height: 30,
            ),
            // 알람
            notification(),
            // 알람 끝
            const SizedBox(
              height: 30,
            ),
            // 기타
            etcWidget(context),
            // 기타 끝
            const SizedBox(
              height: 30,
            ),
            // 로그아웃
            logOut(),
            // 로그아웃 끝
          ],
        ),
      ),
    );
  }
}
