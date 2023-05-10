import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_yoga_animation/core/global/app_assets.dart';
import 'package:flutter_yoga_animation/core/global/app_colors.dart';
import 'package:flutter_yoga_animation/core/widgets/background_circle.dart';
import 'package:flutter_yoga_animation/features/get_started/presentation/views/get_started_view.dart';
import 'package:get/get.dart';

import 'vertical_space.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody>
    with SingleTickerProviderStateMixin {
  bool isCircleVisible = false;
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    setSystemUIOverlayStyle();

    initCircleAnimation();

    initCharacterSlideAnimation();
  }

  @override
  Widget build(BuildContext context) {
    final double resWidth = MediaQuery.of(context).size.width;
    final double resHeight = MediaQuery.of(context).size.height;
    return ListView(
      children: <Widget>[
        VerticalSpace(resHeight: resHeight),
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
          width: isCircleVisible ? resWidth * 0.9 : 0.0,
          height: isCircleVisible ? resWidth * 0.9 : 0.0,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              BackgroundCircle(
                circleWidth: resWidth * 0.9,
                circleBorderWidth: 80.0,
                circleColor: Colors.grey,
                circleOpacity: 0.1,
              ),
              BackgroundCircle(
                circleWidth: resWidth * 0.8,
                circleBorderWidth: 40.0,
                circleColor: Colors.grey,
                circleOpacity: 0.2,
              ),
              SlideTransition(
                position: slideAnimation,
                child: Image.asset(AppAssets.character2),
              ),
            ],
          ),
        ),
        VerticalSpace(resHeight: resHeight),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "The time that leads to mastery is dependent on the intensity of our focus",
            style: Theme.of(context).textTheme.titleLarge!.merge(
                  const TextStyle(
                    color: Colors.grey,
                  ),
                ),
            textAlign: TextAlign.center,
          ),
        ),
        VerticalSpace(resHeight: resHeight),
        Align(
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
        ),
      ],
    );
  }

  void setSystemUIOverlayStyle() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  void updateCircleSize() {
    setState(() {
      isCircleVisible = true;
    });
  }

  void initCircleAnimation() {
    Future.delayed(Duration.zero, () => updateCircleSize());
  }

  void initCharacterSlideAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      reverseDuration: const Duration(seconds: 2),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) animationController.reverse();
        if (status == AnimationStatus.dismissed) animationController.forward();
      });

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.15),
      end: const Offset(0, 0.15),
    ).animate(animationController);

    animationController.forward();
  }
}
