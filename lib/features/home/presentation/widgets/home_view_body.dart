import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/core/widgets/inspiring_text.dart';
import '/core/widgets/vertical_space.dart';
import '/features/home/presentation/widgets/circles_and_character.dart';
import 'restart_button.dart';

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
        VerticalSpace(resHeight: resHeight, height: 0.1),
        CirclesAndCharacter(
          isCircleVisible: isCircleVisible,
          resWidth: resWidth,
          slideAnimation: slideAnimation,
        ),
        VerticalSpace(resHeight: resHeight, height: 0.1),
        const InspiringText(
          text:
              "The time that leads to mastery is dependent on the intensity of our focus",
          textColor: Colors.grey,
        ),
        VerticalSpace(resHeight: resHeight, height: 0.1),
        RestartButton(resWidth: resWidth),
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
