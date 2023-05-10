import 'package:flutter/material.dart';
import 'package:flutter_yoga_animation/features/home/presentation/views/home_view.dart';

void main() {
  runApp(const YogaAnimation());
}

class YogaAnimation extends StatelessWidget {
  const YogaAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: const HomeView(),
    );
  }
}
