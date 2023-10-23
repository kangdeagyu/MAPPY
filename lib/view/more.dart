import 'package:flutter/material.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 393,
        height: 852,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x35000000),
              blurRadius: 25,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: 25,
              top: 391,
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(children: []),
                    ),
                    const SizedBox(width: 26),
                    Text(
                      'payment',
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
            ),
            Positioned(
              left: 18,
              top: 682,
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 33,
                      height: 33,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(children: []),
                    ),
                    const SizedBox(width: 13),
                    Text(
                      'log out',
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
            ),
            Positioned(
              left: 30,
              top: 184,
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 166,
                      height: 78,
                      decoration: ShapeDecoration(
                        color: Color(0x00E0D6D6),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0x7F454545)),
                        ),
                      ),
                    ),
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
                    Container(
                      width: 166,
                      height: 78,
                      decoration: ShapeDecoration(
                        color: Color(0x00E0D6D6),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0x7F454545)),
                        ),
                      ),
                    ),
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
            ),
            Positioned(
              left: 29,
              top: 61,
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: ShapeDecoration(
                        shape: OvalBorder(
                          side: BorderSide(width: 1, color: Color(0xFF2F9BFF)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 57),
                    Container(
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
                          const SizedBox(height: 3),
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
                          const SizedBox(height: 3),
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
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 22,
              top: 574,
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(children: []),
                    ),
                    const SizedBox(width: 7),
                    Text(
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
              ),
            ),
            Positioned(
              left: 23,
              top: 459,
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(children: []),
                    ),
                    const SizedBox(width: 5),
                    Text(
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
              ),
            ),
            Positioned(
              left: 42,
              top: 635,
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dark Mode',
                      style: TextStyle(
                        color: Color(0xFF454545),
                        fontSize: 20,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    const SizedBox(width: 180),
                    Container(
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
                            left: 1,
                            top: 0,
                            child: Container(
                              width: 23,
                              height: 23,
                              decoration: ShapeDecoration(
                                color: Color(0xFF454545),
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
            ),
            Positioned(
              left: 42,
              top: 525,
              child: Container(
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
                    const SizedBox(width: 170),
                    Container(
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
                              decoration: ShapeDecoration(
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
            ),
            Positioned(
              left: 23,
              top: 287,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                            child: Stack(children: []),
                          ),
                          const SizedBox(width: 16),
                          Text(
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
                    const SizedBox(height: 22),
                    Text(
                      'Edit Profile',
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
            ),
          ],
        ),
      ),
    );
  }
}
