import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image/image.dart' as img; // image 패키지 추가

class AgeVM extends GetxController {
  // Property
  var faceImage = Rx<XFile?>(null);
  var displayAnswer = false.obs;
  var displayGreeting = false.obs;
  var displayGuide1 = false.obs;
  var displayGuide2 = false.obs;

  // Function

  resetValues() {
    faceImage.value = null;
    displayAnswer.value = false;
    displayGuide1.value = false;
    displayGuide2.value = false;
    displayGreeting.value = false;
    showMessage();
  }

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

  updateFaceImage() {
    Future.delayed(
        const Duration(seconds: 1), () => displayAnswer.value = true);
  }

  showMessage() {
    Future.delayed(const Duration(milliseconds: 700), () {
      displayGreeting.value = true;
      Future.delayed(const Duration(seconds: 1), () {
        displayGuide1.value = true;
        Future.delayed(const Duration(milliseconds: 1500), () {
          displayGuide2.value = true;
        });
      });
    });
  }
}
