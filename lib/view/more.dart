import 'package:flutter/material.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 유저 화면
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 유저 사진 자리
                Container(
                  width: 120,
                  height: 120,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/임시.jpeg'),
                        fit: BoxFit.fill),
                    shape: OvalBorder(
                      side: BorderSide(width: 1, color: Color(0xFF2F9BFF)),
                    ),
                  ),
                ),
                // 유저 기본 정보
                const SizedBox(
                  width: 40,
                ),
                const SizedBox(
                  width: 130,
                  height: 98,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 177,
                        child: Text(
                          'Name',
                          style: TextStyle(
                            color: Color(0xFF2F9BFF),
                            fontSize: 33,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(height: 3),
                      SizedBox(
                        width: 152,
                        child: Text(
                          'id',
                          style: TextStyle(
                            color: Color(0xFF454545),
                            fontSize: 23,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'since 2022',
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
                )
              ],
            ), // 유저기본정보 끝
            const SizedBox(
              height: 40,
            ),
            // 유저 금액 내역
            SizedBox(
              width: 332,
              height: 78,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 166,
                    height: 78,
                    decoration: const ShapeDecoration(
                      color: Color(0x00E0D6D6),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0x7F454545)),
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PKR125',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF2F9BFF),
                            fontSize: 21,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        Text(
                          '지갑',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF191919),
                            fontSize: 20,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 166,
                    height: 78,
                    decoration: const ShapeDecoration(
                      color: Color(0x00E0D6D6),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0x7F454545)),
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PKR 2K+',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF2F9BFF),
                            fontSize: 21,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        Text(
                          'Spent',
                          textAlign: TextAlign.center,
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
                ],
              ),
            ), // 유저 금액 내역끝
            const SizedBox(
              height: 40,
            ),
            // 유저 프로필
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
                        image: AssetImage('assets/images/임시.jpeg'),
                      ),
                    ),
                  ),
                  const Text(
                    'User',
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
            const SizedBox(
              height: 30,
            ), // 유저 프로필 끝
            // 페이먼트
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
                        image: AssetImage('assets/images/임시.jpeg'),
                      ),
                    ),
                  ),
                  const Text(
                    'Payment',
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
            ), // 페이먼트 끝
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
                        image: AssetImage('assets/images/임시.jpeg'),
                      ),
                    ),
                  ),
                  const Text(
                    'Notification',
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
                        image: AssetImage('assets/images/임시.jpeg'),
                      ),
                    ),
                  ),
                  const Text(
                    'Other',
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
                        image: AssetImage('assets/images/임시.jpeg'),
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
