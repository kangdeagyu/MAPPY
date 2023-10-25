import 'package:flutter/material.dart';

Widget notification() {
  return Column(
    children: [
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
      ),
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
    ],
  );
}
