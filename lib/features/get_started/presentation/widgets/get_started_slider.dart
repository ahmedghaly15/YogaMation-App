import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../../../core/global/app_navigator.dart';
import '../../../home/presentation/views/home_view.dart';

class GetStartedSlider extends StatelessWidget {
  const GetStartedSlider({super.key, required this.resWidth});

  final double resWidth;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final GlobalKey<SlideActionState> key = GlobalKey();
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: resWidth * 0.8,
            child: SlideAction(
              text: "Get Started",
              textStyle: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .merge(const TextStyle(color: Color(0xff28a5da))),
              key: key,
              onSubmit: () => AppNavigator.navigateTo(
                view: const HomeView(),
              ),
              innerColor: const Color(0xff28a5da),
              outerColor: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
