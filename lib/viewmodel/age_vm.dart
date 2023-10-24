import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image/image.dart' as img; // image 패키지 추가

class AgeVM extends GetxController {
  // Property
  var faceImage = Rx<XFile?>(null);
  var displayAnswer = false.obs;
  var displayQuestion = false.obs;

  // Function


  getGalleryImage() async {
    ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (pickedImage != null) {
      // 이미지 크기를 조절하여 maxHeight에 맞춤
      File resizedImage = await resizeImage(pickedImage.path, 250.h);

      faceImage.value = XFile(resizedImage.path);
    }
    updateFaceImage();
  }

  getCameraImage() async {
    ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 70,
    );

    if (pickedImage != null) {
      // 이미지 크기를 조절하여 maxHeight에 맞춤
      File resizedImage = await resizeImage(pickedImage.path, 250.h);

      faceImage.value = XFile(resizedImage.path);
    }
    updateFaceImage();
  }

  Future<File> resizeImage(String imagePath, double maxHeight) async {
    File imageFile = File(imagePath);

    // 이미지를 읽고 크기를 조절
    img.Image image = img.decodeImage(imageFile.readAsBytesSync())!;
    img.Image resizedImage = img.copyResize(image, height: maxHeight.toInt());

    // 조절된 이미지를 파일로 저장
    File resizedFile = File(imagePath);
    resizedFile.writeAsBytesSync(img.encodeJpg(resizedImage));

    return resizedFile;
  }

  void updateFaceImage() { 
    Future.delayed(const Duration(seconds :1), () => displayAnswer.value = true);
  }

  void showQuestion() {
    Future.delayed(const Duration(milliseconds: 700), () => displayQuestion.value = true);
  }

}
