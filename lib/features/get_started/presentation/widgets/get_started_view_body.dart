import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_yoga_animation/core/global/app_assets.dart';
import 'package:flutter_yoga_animation/core/global/app_navigator.dart';
import 'package:flutter_yoga_animation/features/home/presentation/views/home_view.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/widgets/background_circle.dart';
import '../../../../core/widgets/vertical_space.dart';

class GetStartedViewBody extends StatefulWidget {
  const GetStartedViewBody({super.key});

  @override
  State<GetStartedViewBody> createState() => _GetStartedViewBodyState();
}

class _GetStartedViewBodyState extends State<GetStartedViewBody>
    with SingleTickerProviderStateMixin {
  // final player = AudioPlayer();

  bool isCircleVisible = false;
  Offset offset = const Offset(120, 0);
  final double width = 200;
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
        Align(
          alignment: Alignment.center,
          child: Text(
            "Share.",
            style: Theme.of(context).textTheme.displayMedium!.merge(
                  const TextStyle(
                    color: Colors.white,
                  ),
                ),
          ),
        ),
        VerticalSpace(resHeight: resHeight, height: 0.025),
        Align(
          alignment: Alignment.center,
          child: Text(
            "It's not how much we give but\nhow much love we put into giving.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.merge(
                  const TextStyle(color: Colors.white),
                ),
          ),
        ),
        VerticalSpace(resHeight: resHeight, height: 0.025),
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          height: isCircleVisible ? resHeight * 0.5 : 0.0,
          width: isCircleVisible ? resWidth * 0.9 : 0.0,
          curve: Curves.easeOut,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
                right: offset.dx - (width / 2),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    BackgroundCircle(
                      circleWidth: resWidth * 0.9,
                      circleBorderWidth: 80.0,
                      circleOpacity: 0.2,
                      circleColor: Colors.white,
                    ),
                    BackgroundCircle(
                      circleWidth: resWidth * 0.8,
                      circleBorderWidth: 40.0,
                      circleOpacity: 0.3,
                      circleColor: Colors.white,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onPanUpdate: (details) => movingCharacter(context, details),
                onPanEnd: (details) => returnCharacterToFirstPosition(),
                child: SizedBox(
                  height: resHeight * 0.5,
                  child: Stack(
                    children: <Widget>[
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                        left: offset.dx - (width / 2),
                        child: SizedBox(
                          width: resWidth * 0.9,
                          height: resHeight * 0.5,
                          child: Image.asset(
                            AppAssets.character1,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onPanUpdate: (details) => movingCharacter(context, details),
          onPanEnd: (details) => returnCharacterToFirstPosition(),
          child: SizedBox(
            height: 44,
            child: !charactermoving
                ? Image.asset(
                    'assets/images/left-and-right-arrows.png',
                    color: Colors.white,
                  )
                : const SizedBox(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Builder(
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
        ),
      ],
    );
  }

  void returnCharacterToFirstPosition() {
    setState(() {
      offset = const Offset(120, 0);
      charactermoving = false;
    });
  }

  void movingCharacter(BuildContext context, DragUpdateDetails details) {
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
