import 'package:flutter/material.dart';

class InpiringText extends StatelessWidget {
  const InpiringText({
    super.key,
    required this.text,
    required this.textColor,
  });

  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge!.merge(
              TextStyle(
                color: textColor,
              ),
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
