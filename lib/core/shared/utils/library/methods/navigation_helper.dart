// Flutter imports:
import "package:flutter/material.dart";

class NavigationHelper {
  // Method for Navigator.push
  static Future<T?> pushPage<T>(BuildContext context, Widget page) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  // Method for Navigator.pushReplacement
  static Future<T?> pushReplacementPage<T>(BuildContext context, Widget page) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  // Method for Navigator.pushAndRemoveUntil
  static Future<T?> pushAndRemoveUntilPage<T>(
    BuildContext context,
    Widget page,
  ) {
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
  }
}
