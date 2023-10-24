import 'package:final_main_project/components/charge_components.dart';
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
              color: Colors.grey[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 340.w,
                    height: 30.h,
                    child: const Text('현재 보유 코인'),
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
                          color: Theme.of(context).colorScheme.onBackground,
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
                  // 유저 금액 내역
                  Container(
                    width: 330.w,
                    height: 40.h,
                    color: Theme.of(context).colorScheme.background,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 180,
                          height: 78,
                          decoration: const ShapeDecoration(
                            color: Color(0x00E0D6D6),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0x7F454545)),
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
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: Colors.black,
                            ),
                            label: const Text(
                              '충전하기',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            style: TextButton.styleFrom(
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(0.1),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 180,
                          height: 78,
                          decoration: const ShapeDecoration(
                            color: Color(0x00E0D6D6),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0x7F454545)),
                            ),
                          ),
                          child: TextButton.icon(
                            onPressed: () {
                              //
                            },
                            icon: const Icon(
                              Icons.list_alt,
                              color: Colors.black,
                            ),
                            label: const Text(
                              '사용내역',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
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
            SizedBox(
              height: 10.h,
            ), // 유저 프로필 끝
            // 페이먼트
            paymentWidget(),
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
            SizedBox(
              width: 324,
              height: 24,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Notification',
                    style: TextStyle(
                      color: Color(0xFF454545),
                      fontSize: 20,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  const SizedBox(width: 140),
                  SizedBox(
                    width: 47,
                    height: 23,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 1,
                          child: Container(
                            width: 47,
                            height: 21,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF5F5F5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.50),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 24,
                          top: 0,
                          child: Container(
                            width: 23,
                            height: 23,
                            decoration: const ShapeDecoration(
                              color: Color(0xFF2F9BFF),
                              shape: OvalBorder(),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x4F000000),
                                  blurRadius: 3,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // 기타
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
                        image: AssetImage('assets/images/setting.png'),
                      ),
                    ),
                  ),
                  const Text(
                    '기타',
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
            ), // 기타 끝
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 324,
              height: 24,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Dark Mode',
                    style: TextStyle(
                      color: Color(0xFF454545),
                      fontSize: 20,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  const SizedBox(width: 150),
                  SizedBox(
                    width: 47,
                    height: 23,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 1,
                          child: Container(
                            width: 47,
                            height: 21,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF5F5F5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.50),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 24,
                          top: 0,
                          child: Container(
                            width: 23,
                            height: 23,
                            decoration: const ShapeDecoration(
                              color: Color(0xFF2F9BFF),
                              shape: OvalBorder(),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x4F000000),
                                  blurRadius: 3,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
