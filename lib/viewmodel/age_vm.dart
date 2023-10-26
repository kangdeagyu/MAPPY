import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_main_project/model/age_result_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AgeVM extends GetxController {
  // Property
  var faceImage = Rx<XFile?>(null); // 선택된 사진 파일 저장
  var croppedFaceImage = Rx<XFile?>(null); // 인식된 얼굴 사진 파일로 저장
  var displayAnswer = false.obs; // 답변 대화창 상태
  var displayGreeting = false.obs; // 첫 대화창 상태
  var displayGuide1 = false.obs; // 두 번째 대화창 상태
  var displayGuide2 = false.obs; // 세 번째 대화창 상태

  Rx<AgeResult> result = AgeResult(
    // 결과모델 초기화
    age: '',
    percent10: 0,
    percent20: 0,
    percent30: 0,
    percent40: 0,
    percent50: 0,
    percent60: 0,
    percent70: 0,
  ).obs;

  RxInt myCoin = 0.obs; // 실시간 관리 위해 obs 사용
  RxString userName = ''.obs; // 유저이름 저장
  Rx<int?> cropResponeCode = Rx<int?>(null);
 // 크롭 결과 저장

  // Function
  @override
  void onInit() {
    super.onInit();
    resetValues();
    checkCoin();
    getUserName();
    loadUserID();
  }

  // 이미지 보내 예측값 받기
  Future<void> sendFaceImage() async {
    final url = Uri.parse('http://18.218.101.241:5000/FaceModel/faceAge');
    var request = http.MultipartRequest('POST', url);

    request.files.add(
      await http.MultipartFile.fromPath(
        'file', // 서버에서 사용할 필드 이름
        faceImage.value!.path, // 이미지 파일 경로
      ),
    );

    try {
      var streamedResponse = await request.send();
      if (streamedResponse.statusCode == 200) {
        // 서버 응답이 성공인 경우
        final response = await http.Response.fromStream(streamedResponse);
        final data = response.body;
        final parsedData = json.decode(data);
        result.value = AgeResult.fromJson(parsedData);

        // 일반 변수이기 때문에
        update();

        // print('성공!!$result');
      } else {
        // 서버 응답이 실패인 경우
        // print('업로드 실패: ${streamedResponse.reasonPhrase}');
        // print('업로드 실패: ${streamedResponse.statusCode}');
      }
    } catch (e) {
      // 오류 처리
      // print('업로드 중 오류 발생: $e');
    }
  }

  // 이미지 보내 잘린 얼굴 이미지 받기
  Future<void> getCroppedImage() async {
    cropResponeCode.value = -1;
    final url = Uri.parse('http://18.218.101.241:5000/FaceModel/faceCrop');
    var request = http.MultipartRequest('POST', url);

    request.files.add(
      await http.MultipartFile.fromPath(
        'file', // 서버에서 사용할 필드 이름
        faceImage.value!.path, // 이미지 파일 경로
      ),
    );

    try {
      var streamedResponse = await request.send();
      cropResponeCode.value = streamedResponse.statusCode;
      if (streamedResponse.statusCode == 200) {
        // 서버 응답이 성공인 경우
        final response = await http.Response.fromStream(streamedResponse);
        final data = response.bodyBytes; // 이미지 데이터를 byte로 받아옵니다.

        // 받아온 이미지 데이터를 임시 파일로 저장합니다.
        final file = await File('${faceImage.value!.path}_cropped.jpg')
            .writeAsBytes(data);

        // 임시 파일을 XFile로 변환하고, Rx<XFile?> 변수에 저장합니다.
        File resizedImage = await resizeImage(file.path, 250.h);
        croppedFaceImage.value = XFile(resizedImage.path);

        // print('성공!!.');
      } else {
        // 서버 응답이 실패인 경우
        // print('업로드 실패: ${streamedResponse.reasonPhrase}');
        // print('업로드 실패: ${streamedResponse.statusCode}');
        // 이전 이미지가 저장되어있을 경우 비워주기. 답변 메시지가 이 값의 null 유무로 판단하기 때문!
        croppedFaceImage.value = null;
      }
    } catch (e) {
      // 오류 처리
      //print('업로드 중 오류 발생: $e');
    }
  }

  // 코인 차감.
  Future<void> useCoin(int price) async {
    try {
      String userId = await loadUserID();

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("user")
          .where("uid", isEqualTo: userId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        int currentCoin = querySnapshot.docs[0]['coin'];
        int newCoin = currentCoin - price;
        // 업데이트
        querySnapshot.docs.first.reference.update({
          'coin': newCoin,
        });
      }
    } catch (error) {
      // print("코인 수정 오류: $error");
    }
  }

  //보유 코인 개수 가져오기
  Future<void> checkCoin() async {
    try {
      String userId = await loadUserID();
      FirebaseFirestore.instance
          .collection("user")
          .where("uid", isEqualTo: userId)
          .snapshots()
          .listen((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          myCoin.value = querySnapshot.docs[0]['coin'];
        }
      });
    } catch (error) {
      // print("코인 가져오기 오류: $error");
    }
  }

  // 유저 이름 가져오기
  Future<void> getUserName() async {
    try {
      String userId = await loadUserID();
      FirebaseFirestore.instance
          .collection("user")
          .where("uid", isEqualTo: userId)
          .snapshots()
          .listen((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          userName.value = querySnapshot.docs[0]['uname'];
        }
      });
    } catch (error) {
      // print("유저이름 가져오기 오류: $error");
    }
  }

  // 유저 아이디 들고오기
  Future<String> loadUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("p_userId")!;
    return userId;
  }

  // 화면 초기화를 위한 변수 리셋
  resetValues() {
    faceImage.value = null;
    displayAnswer.value = false;
    displayGuide1.value = false;
    displayGuide2.value = false;
    displayGreeting.value = false;
    showMessage();
  }

  // 갤러리 열기
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
    // 이미지 저장 후 잘린 이미지 요청하기.
    await getCroppedImage();
  }

  // 카메라 열기
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
    await updateFaceImage();
    await getCroppedImage();
  }

  // 이미지 리사이즈
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

  // 이미지가 등록되면 잠시 후 답변글이 올라오게.
  updateFaceImage() {
    Future.delayed(
        const Duration(milliseconds: 1200), () => displayAnswer.value = true);
  }

  // 화면 시작 시 메시지를 단계적으로 보여주기 위해.
  showMessage() {
    Future.delayed(const Duration(milliseconds: 700), () {
      displayGreeting.value = true;
      Future.delayed(const Duration(milliseconds: 900), () {
        displayGuide1.value = true;
        Future.delayed(const Duration(milliseconds: 1500), () {
          displayGuide2.value = true;
        });
      });
    });
  }
}
