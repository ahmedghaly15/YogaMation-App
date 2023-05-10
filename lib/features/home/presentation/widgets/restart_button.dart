import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/global/app_colors.dart';
import '../../../get_started/presentation/views/get_started_view.dart';

class RestartButton extends StatelessWidget {
  const RestartButton({
    super.key,
    required this.resWidth,
  });

  final double resWidth;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => Get.to(
          () => const GetStartedView(),
          transition: Transition.rightToLeft,
        ),
        child: Container(
          width: resWidth * 0.32,
          decoration: BoxDecoration(
            color: AppColors.kPrimaryColor,
            borderRadius: BorderRadius.circular(13.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.restart_alt,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Text(
                  "Restart",
                  style: Theme.of(context).textTheme.titleMedium!.merge(
                        const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
