import "dart:math";
import "dart:ui";
import "package:flutter/material.dart";

// Design size constants - adjust these to match your design specs
const double DESIGN_WIDTH = 375;
const double DESIGN_HEIGHT = 812;

extension ResponsiveSize on num {
  static double? _screenWidth;
  static double? _screenHeight;

  // Initialize dimensions
  static void init(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
  }

  // Responsive width
  double get wR => (this / DESIGN_WIDTH) * (_screenWidth ?? DESIGN_WIDTH);

  // Responsive height
  double get hR => (this / DESIGN_HEIGHT) * (_screenHeight ?? DESIGN_HEIGHT);

  // Responsive size - scales based on the smaller ratio to maintain proportions
  double get R {
    if (_screenWidth == null || _screenHeight == null) {
      return toDouble();
    }

    final ratioWidth = _screenWidth! / DESIGN_WIDTH;
    final ratioHeight = _screenHeight! / DESIGN_HEIGHT;

    return (this * min(ratioWidth, ratioHeight)).toDouble();
  }
}
