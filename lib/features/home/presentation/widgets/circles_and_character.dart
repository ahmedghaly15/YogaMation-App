import 'package:flutter/material.dart';

import '../../../../core/global/app_assets.dart';
import '../../../../core/widgets/background_circle.dart';

class CirclesAndCharacter extends StatelessWidget {
  const CirclesAndCharacter({
    super.key,
    required this.isCircleVisible,
    required this.resWidth,
    required this.slideAnimation,
  });

  final bool isCircleVisible;
  final double resWidth;
  final Animation<Offset> slideAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
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
    );
  }
}
