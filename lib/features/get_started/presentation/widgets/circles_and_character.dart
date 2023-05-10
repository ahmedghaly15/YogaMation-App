import 'package:flutter/material.dart';

import '../../../../core/global/app_assets.dart';
import '../../../../core/widgets/background_circle.dart';

class CirclesAndCharacter extends StatelessWidget {
  const CirclesAndCharacter({
    super.key,
    required this.isCircleVisible,
    required this.offset,
    required this.charactermoving,
    required this.resHeight,
    required this.resWidth,
    required this.movingCharacter,
    required this.returnCharacterToFirstPosition,
  });

  final double resHeight;
  final double resWidth;
  final bool isCircleVisible;
  final Offset offset;
  final double width = 200;
  final bool charactermoving;
  final void Function(BuildContext context, DragUpdateDetails details)
      movingCharacter;

  final void Function() returnCharacterToFirstPosition;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
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
    );
  }
}
