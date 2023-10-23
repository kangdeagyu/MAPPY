import 'package:flutter/material.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 유저 화면
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 유저 사진 자리
              Container(
                width: 100,
                height: 100,
                decoration: const ShapeDecoration(
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
            height: 30,
          ),
          // 유저 금액 내역
          Container(
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
            height: 28,
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
                  decoration: BoxDecoration(),
                ),
                const Text(
                  'Account',
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
            height: 20,
          ),
          const SizedBox(
            width: 280,
            height: 30,
            child: Row(
              children: [
                Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Color(0xFF454545),
                    fontSize: 15,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                )
              ],
            ),
          ) // 유저 프로필 끝
        ],
      ),
    );
  }
}
