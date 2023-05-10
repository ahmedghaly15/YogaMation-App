import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/global/app_theme.dart';
import '/features/get_started/presentation/views/get_started_view.dart';

void main() => runApp(const YogaAnimation());

// TODO : change app logo to character in home view

class YogaAnimation extends StatelessWidget {
  const YogaAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme(),
      home: const GetStartedView(),
    );
  }
}
