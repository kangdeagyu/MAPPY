import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:shared_preferences/shared_preferences.dart'; // image 패키지 추가

class AgeVM extends GetxController {
  // Property
  var faceImage = Rx<XFile?>(null);
  var displayAnswer = false.obs;
  var displayGreeting = false.obs;
  var displayGuide1 = false.obs;
  var displayGuide2 = false.obs;
  
  RxInt myCoin = 0.obs; // 실시간 관리 위해 obs 사용
  String userName = '';
  
  // Function
@override
  void onInit() {
    super.onInit();
    checkCoin();
    getUserName();
    loadUserID();
  }

  // 보유 코인 개수 가져오기
  Future<void> checkCoin() async {
    String userId = await loadUserID();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("user")
        .where("uid", isEqualTo: userId)
        .get();
        myCoin.value = querySnapshot.docs[0]['coin'];
  }

  // 유저 이름 가져오기
  Future<void> getUserName() async {
    String userId = await loadUserID();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("user")
        .where("uid", isEqualTo: userId)
        .get();
        userName = querySnapshot.docs[0]['uname'];
  }

  // 유저 아이디 들고오기
  Future<String> loadUserID() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userId = prefs.getString("p_userId")!;
      return userId;
    }


  resetValues() { // 화면 초기화를 위한 변수 리셋
    faceImage.value = null;
    displayAnswer.value = false;
    displayGuide1.value = false;
    displayGuide2.value = false;
    displayGreeting.value = false;
    showMessage();
  }

  getGalleryImage() async { // 갤러리 열기
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

  getCameraImage() async { // 카메라 열기
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


  updateFaceImage() { // 이미지가 등록되면 1초 후 답변글이 올라오게.
    Future.delayed(
        const Duration(seconds: 1), () => displayAnswer.value = true);
  }

  showMessage() { // 화면 시작 시 메시지를 단계적으로 보여주기 위해.
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
