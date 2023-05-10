import 'package:flutter/material.dart';

class ArrowsController extends StatelessWidget {
  const ArrowsController({
    super.key,
    required this.charactermoving,
    required this.movingCharacter,
    required this.returnCharacterToFirstPosition,
  });

  final bool charactermoving;
  final void Function(BuildContext context, DragUpdateDetails details)
      movingCharacter;

  final void Function() returnCharacterToFirstPosition;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
