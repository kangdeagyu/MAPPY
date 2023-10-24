import 'package:final_main_project/widget/age/age_percent_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AgeResultScreen extends StatefulWidget {
  const AgeResultScreen({super.key});

  @override
  State<AgeResultScreen> createState() => _AgeResultScreenState();
}

class _AgeResultScreenState extends State<AgeResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('당신의 나이는 20대입니다.'),
            agePercentWidget(10, 40.0, Colors.red),
            agePercentWidget(20, 92.4, Colors.orange),
            agePercentWidget(30, 30.0, Colors.amber),
            agePercentWidget(40, 15.7, Colors.green),
            agePercentWidget(50, 13.01, Colors.blue),
            agePercentWidget(60, 5.03, Colors.blue[900]!),
            agePercentWidget(70, 3.01, Colors.purple),
          ],
        ),
      ),
    );
  }
}