import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/global/app_theme.dart';
import '/features/get_started/presentation/views/get_started_view.dart';

void main() => runApp(const YogaMation());

class YogaMation extends StatelessWidget {
  const YogaMation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme(),
      home: const GetStartedView(),
    );
  }
}
