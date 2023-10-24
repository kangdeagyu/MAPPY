import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AgeVM extends GetxController{
  // Property
  var faceImage = Rx<XFile?>(null);

  // Function
  getGalleryImage() async{
    ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(
      source: ImageSource.gallery, 
      imageQuality: 70,
      maxHeight: 250.h
    );

    if (pickedImage != null){
      faceImage.value = pickedImage;
    }
  } // getImage
}