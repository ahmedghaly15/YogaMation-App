import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_yoga_animation/core/widgets/inspiring_text.dart';
import 'package:flutter_yoga_animation/features/get_started/presentation/widgets/arrows_controller.dart';
import 'package:flutter_yoga_animation/features/get_started/presentation/widgets/circles_and_character.dart';
import 'package:flutter_yoga_animation/features/get_started/presentation/widgets/get_started_slider.dart';
// import 'package:just_audio/just_audio.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/widgets/vertical_space.dart';

class GetStartedViewBody extends StatefulWidget {
  const GetStartedViewBody({super.key});

  @override
  State<GetStartedViewBody> createState() => _GetStartedViewBodyState();
}

class _GetStartedViewBodyState extends State<GetStartedViewBody>
    with SingleTickerProviderStateMixin {
  bool isCircleVisible = false;
  Offset offset = const Offset(120, 0);
  bool charactermoving = false;

  @override
  void initState() {
    super.initState();

    setSystemUIOverlayStyle();

    initCircleAnimation();
  }

  @override
  Widget build(BuildContext context) {
    final resWidth = MediaQuery.of(context).size.width;
    final resHeight = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        VerticalSpace(resHeight: resHeight, height: 0.025),
        Text(
          "Share.",
          style: Theme.of(context).textTheme.displayMedium!.merge(
                const TextStyle(
                  color: Colors.white,
                ),
              ),
          textAlign: TextAlign.center,
        ),
        VerticalSpace(resHeight: resHeight, height: 0.025),
        const InspiringText(
          text:
              "It's not how much we give but\nhow much love we put into giving.",
          textColor: Colors.white,
        ),
        VerticalSpace(resHeight: resHeight, height: 0.025),
        CirclesAndCharacter(
          isCircleVisible: isCircleVisible,
          offset: offset,
          charactermoving: charactermoving,
          resHeight: resHeight,
          resWidth: resWidth,
          movingCharacter: moveCharacter,
          returnCharacterToFirstPosition: returnCharacterToFirstPosition,
        ),
        ArrowsController(
          charactermoving: charactermoving,
          movingCharacter: moveCharacter,
          returnCharacterToFirstPosition: returnCharacterToFirstPosition,
        ),
        VerticalSpace(resHeight: resHeight, height: 0.025),
        GetStartedSlider(resWidth: resWidth),
      ],
    );
  }

  void returnCharacterToFirstPosition() {
    setState(() {
      offset = const Offset(120, 0);
      charactermoving = false;
    });
  }

  void moveCharacter(BuildContext context, DragUpdateDetails details) {
    RenderBox getBox = context.findRenderObject() as RenderBox;
    setState(() {
      offset = getBox.localToGlobal(details.globalPosition);
      charactermoving = true;
    });
  }

  void setSystemUIOverlayStyle() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.kPrimaryColor,
        statusBarColor: AppColors.kPrimaryColor,
        statusBarBrightness: Brightness.light,
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
}
