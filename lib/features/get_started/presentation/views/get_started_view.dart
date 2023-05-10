import 'package:flutter/material.dart';
import 'package:flutter_yoga_animation/features/get_started/presentation/widgets/get_started_view_body.dart';

import '../../../../core/global/app_colors.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: GetStartedViewBody(),
    );
  }
}
