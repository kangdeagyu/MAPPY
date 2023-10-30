import 'package:final_main_project/widget/register/register_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisibleController extends GetxController{
  int counter = 1;

  // 텍스트필드 값
  TextEditingController textEditingController = TextEditingController(text: Message_wook.kid ?? "");

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