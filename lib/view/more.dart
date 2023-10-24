import 'package:final_main_project/components/more/charge_components.dart';
import 'package:final_main_project/widget/more/etc_widget.dart';
import 'package:final_main_project/widget/more/payment_widget.dart';
import 'package:final_main_project/widget/more/userpage_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
            // 유저 코인
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
                        Container(
                          width: 180,
                          height: 78,
                          decoration: ShapeDecoration(
                            color: Theme.of(context).colorScheme.onPrimary,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          child: TextButton.icon(
                            onPressed: () {
                              Get.bottomSheet(
                                Container(
                                  height: 600.h,
                                  color: Colors.white,
                                  child: const ChargeWidget(),
                                ),
                                isScrollControlled: true,
                              );
                            },
                            icon: Icon(
                              Icons.add_circle_outline,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            label: Text(
                              '충전하기',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 20,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(0.1),
                              ),
                            ),
                          ),
                        ),
                        // 사용 내역
                        Container(
                          width: 180,
                          height: 78,
                          decoration: ShapeDecoration(
                            color: Theme.of(context).colorScheme.onPrimary,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                          ),
                          child: TextButton.icon(
                            onPressed: () {
                              //
                            },
                            icon: Icon(
                              Icons.list_alt,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            label: Text(
                              '사용내역',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 20),
                            ),
                            style: TextButton.styleFrom(
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(0.1),
                              ),
                            ),
                          ),
                        ),
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
            SizedBox(
              width: 350,
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/notification.png'),
                      ),
                    ),
                  ),
                  const Text(
                    '알람',
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
            ), // 알람 끝
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              width: 324,
              height: 24,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Notification',
                    style: TextStyle(
                      color: Color(0xFF454545),
                      fontSize: 20,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            // 알람 끝
            const SizedBox(
              height: 30,
            ),
            // 기타
            etcWidget(),
            // 기타 끝
            const SizedBox(
              height: 30,
            ),
            // 로그아웃
            SizedBox(
              width: 350,
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 36,
                    height: 36,
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
            ), // 로그아웃 끝
          ],
        ),
      ),
    );
  }
}
