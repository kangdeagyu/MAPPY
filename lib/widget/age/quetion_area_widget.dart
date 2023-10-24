import 'package:final_main_project/styles/button_style.dart';
import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget questionAreaWidget(BuildContext context) {

  final vm = Get.find<AgeVM>();

  return Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Age_Icon.png'),
                  backgroundColor: Colors.white,
                  radius: 20,
                ),
                SizedBox(width: 8.w),
                Container(
                  width: 215,
                  padding: const EdgeInsets.all(12.0),
                  margin: const EdgeInsets.only(right: 80.0, bottom: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Text(
                          '00님의 얼굴 나이를 예측해보세요. 결과는 10대부터 70대까지 확인하실 수 있어요. 00님의 실제 나이와 비교해 동안 테스트를 해 볼 수 있어요.'),
                      ElevatedButton(
                        style: primaryButtonStyle(context),
                        onPressed: () {
                          Get.dialog(
                            AlertDialog(
                              content: SizedBox(
                                height: 100.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton.icon(
                                      icon: const Icon(Icons.camera_alt),
                                      label: const Text('카메라'),
                                      style: primaryButtonStyle(context),
                                      onPressed: () {
                                        Get.back();
                                        vm.getCameraImage();
                                      },
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    ElevatedButton.icon(
                                      style: primaryButtonStyle(context),
                                      icon: const Icon(Icons.photo),
                                      label: const Text('갤러리'),
                                      onPressed: () {
                                        Get.back();
                                        vm.getGalleryImage();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: const Text('이미지 업로드'),
                      ),
                    ],
                  ),
                ),
              ],
            );
}
