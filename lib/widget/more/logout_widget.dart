import 'package:flutter/material.dart';

Widget logOut() {
  return SizedBox(
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
  );
}
