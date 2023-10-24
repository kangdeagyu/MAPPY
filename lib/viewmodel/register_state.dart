import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisibleController extends GetxController{
  int counter = 1;

  // 텍스트필드 값
  TextEditingController textEditingController = TextEditingController(text: "");

  List infoList = [];

  increase(){
    if (counter >= 4){
      counter = 4 ;
    }else{
      counter ++;
    }
    update();
  }
  decrease(){
    counter --;
    update();
  }


}