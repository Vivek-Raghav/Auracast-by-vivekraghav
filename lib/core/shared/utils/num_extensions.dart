// Flutter imports:
import "package:auracast/core/shared/utils/responsive_extentions.dart";
import "package:flutter/widgets.dart";

extension NumExtensions on num {
  //duration extensions
  Duration get microseconds => Duration(microseconds: round());
  Duration get ms => (this * 1000).microseconds;
  Duration get milliseconds => (this * 1000).microseconds;
  Duration get seconds => (this * 1000 * 1000).microseconds;
  Duration get minutes => (this * 1000 * 1000 * 60).microseconds;
  Duration get hours => (this * 1000 * 1000 * 60 * 60).microseconds;
  Duration get days => (this * 1000 * 1000 * 60 * 60 * 24).microseconds;

  //sized box extensions
  Widget get sw => SizedBox(width: toDouble().R);
  Widget get sh => SizedBox(height: toDouble().R);

  //radius extensions
  Radius get r => Radius.circular(toDouble());
}
