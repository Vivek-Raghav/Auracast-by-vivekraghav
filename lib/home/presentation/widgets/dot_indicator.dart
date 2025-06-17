import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final int length;
  final int currentIndex;
  final double dotSize;
  final double spacing;
  final Color activeColor;
  final Color inactiveColor;

  const DotIndicator({
    super.key,
    required this.length,
    required this.currentIndex,
    this.dotSize = 10.0,
    this.spacing = 8.0,
    this.activeColor = const Color.fromARGB(255, 255, 255, 255),
    this.inactiveColor = const Color(0xFFD3D3D3),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        final isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          width: isActive ? dotSize * 3 : dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            color: isActive ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(dotSize),
          ),
        );
      }),
    );
  }
}
