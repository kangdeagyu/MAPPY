import 'package:get/get.dart';

class VisibleController extends GetxController{
  int counter = 1;

  increase(){
    if (counter == 4){
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