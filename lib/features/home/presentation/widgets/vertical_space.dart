import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({
    super.key,
    required this.resHeight,
  });

  final double resHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: resHeight * 0.1);
  }
}
