import 'package:final_main_project/view/age_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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

  //이미지를 가져오는 함수
  Future getImage(ImageSource imageSource) async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _faceImage = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle customButtonStyle = ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
      foregroundColor:
          MaterialStateProperty.all(Theme.of(context).colorScheme.onPrimary),
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildPhotoArea(),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('카메라'),
                  style: customButtonStyle,
                  onPressed: () {
                    Get.defaultDialog(
                      title: '경고!',
                      content: const Text('ios 시뮬레이터에서 카메라 사용 불가'),
                      textConfirm: '확인',
                      confirmTextColor: Theme.of(context).colorScheme.onPrimary,
                      buttonColor: Theme.of(context).colorScheme.primary,
                      onConfirm: () => Get.back(),
                    );
                  },
                ),
                SizedBox(
                  width: 15.w,
                ),
                ElevatedButton.icon(
                  style: customButtonStyle,
                  icon: const Icon(Icons.photo),
                  label: const Text('갤러리'),
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            ElevatedButton(
              style: customButtonStyle,
              onPressed: () {
                Get.to(const AgeResultScreen());
              },
              child: const Text('결과 확인'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoArea() {
    return _faceImage != null
        ? SizedBox(
            // 이미지가 있으면 보여주고
            width: 320.h,
            height: 250.h,
            child: Image.file(File(_faceImage!.path)), //가져온 이미지를 화면에 띄워주는 코드
          )
        : Container(
            // 없으면 add photo 화면 보여주기
            width: 320.w,
            height: 250.h,
            color: Colors.grey[300],
            child: Center(
              child: Image.asset('assets/images/add_photo.png'),
            ),
          );
  }
}
