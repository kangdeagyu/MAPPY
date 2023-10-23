import 'package:flutter/material.dart';

class AgeResultScreen extends StatelessWidget {
  const AgeResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('당신의 나이는????')
          ],
        ),
      ),
    );
  }
}