import 'package:auracast/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TitleMediumTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const TitleMediumTextWidget({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? defaultStyle = Theme.of(context).textTheme.titleMedium;
    return Text(
      text,
      style: defaultStyle?.copyWith(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

class HeadlineSmallTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const HeadlineSmallTextWidget({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? defaultStyle = Theme.of(context).textTheme.headlineSmall;
    return Text(
      text,
      style: defaultStyle?.copyWith(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color ?? ThemeColors.clrWhite),
    );
  }
}
