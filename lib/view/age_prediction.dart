import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:final_main_project/widget/age/answer_area_widget.dart';
import 'package:final_main_project/widget/age/photo_area_widget.dart';
import 'package:final_main_project/widget/age/quetion_area_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AgePrediction extends StatelessWidget {
  AgePrediction({super.key});

  final vm = Get.put(AgeVM());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/Age_Icon.png'),
              backgroundColor: Colors.white,
              radius: 20,
            ),
            SizedBox(width: 8),
            Text('예나'),
          ],
        ),
        actions: const [
          Icon(
            Icons.monetization_on,
            color: Colors.green,
            size: 25,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '100',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            questionAreaWidget(context),
            Padding(
              padding: EdgeInsets.all(5.0.h),
              child: Align(
                alignment: Alignment.centerRight,
                child: photoAreaWidget(),
              ),
            ),
            answerAreaWidget(context),
          ],
        ),
      ),
    );
  }
}
