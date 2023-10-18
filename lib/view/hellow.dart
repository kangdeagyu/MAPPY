import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hi"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1"),
              Text("2"),
            ],
          ),
        ),
      ),
    );
  }
}
