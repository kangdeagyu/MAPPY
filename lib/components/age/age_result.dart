import 'package:final_main_project/styles/button_style.dart';
import 'package:final_main_project/styles/text_style.dart';
import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:final_main_project/widget/age/age_percent_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AgeResultScreen extends StatefulWidget {
  const AgeResultScreen({super.key});

  @override
  State<AgeResultScreen> createState() => _AgeResultScreenState();
}

class _AgeResultScreenState extends State<AgeResultScreen> {

  final vm = Get.put(AgeVM());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '당신의 나이는 20대입니다.',
              style: onBackgroundTextStyle(context, 25),
            ),
            SizedBox(height: 30.h,),
            agePercentWidget(context, 10, 40.0, Colors.red),
            agePercentWidget(context, 20, 92.4, Colors.orange),
            agePercentWidget(context, 30, 30.0, Colors.amber),
            agePercentWidget(context, 40, 15.7, Colors.green),
            agePercentWidget(context, 50, 13.01, Colors.blue),
            agePercentWidget(context, 60, 5.03, Colors.blue[900]!),
            agePercentWidget(context, 70, 3.01, Colors.purple),

            SizedBox(height: 50.h,),
            ElevatedButton(
              style: primaryButtonStyle(context),
              onPressed: () {
                vm.resetValues();
                Get.back();
              }, 
              child: Text('다시 테스트하기', style: buttonTextStyle(context),),
            ),
          ],
        ),
      ),
    );
  }
}