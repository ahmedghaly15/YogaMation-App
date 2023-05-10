import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppNavigator {
  static void navigateTo({required Widget view}) {
    Get.to(() => view, transition: Transition.rightToLeft);
  }
}
