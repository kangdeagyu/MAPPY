import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AgePrediction extends StatefulWidget {
  const AgePrediction({super.key});

  @override
  State<AgePrediction> createState() => _AgePredictionState();
}

class _AgePredictionState extends State<AgePrediction> {

  XFile? _faceImage; // 이미지 담을 변수 선언
  final ImagePicker picker = ImagePicker(); // ImagePicker 초기화

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildPhotoArea(),
            SizedBox(height: 15.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('카메라'),
                  onPressed: () {
                    
                  },
                ),
                SizedBox(width: 15.w,),
                ElevatedButton.icon(
                  icon: const Icon(Icons.photo),
                  label: const Text('갤러리'),
                  onPressed: () {
                    
                  },
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }

  Widget _buildPhotoArea() {
  return _faceImage != null
      ? SizedBox( // 이미지가 있으면 보여주고
          width: 300,
          height: 300,
          child: Image.file(File(_faceImage!.path)), //가져온 이미지를 화면에 띄워주는 코드
        )
      : Container( // 없으면 add photo 화면 보여주기
          width: 250,
          height: 250,
          color: Colors.grey[300],
          child: Center(
            child: Image.asset('assets/images/add_photo.png'),
          ),
        );
  }
}