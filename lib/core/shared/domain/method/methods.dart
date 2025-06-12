import 'dart:ui';

import 'package:auracast/core/constants/global_const.dart';
import 'package:flutter/material.dart';

bool _isSnackbarClosing = false;
Future<void> showToast({
  required String title,
  String? subTitle,
  Duration? duration,
}) async {
  if (_isSnackbarClosing) return;
  _isSnackbarClosing = true;

  if (messenger != null) {
    messenger!
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          duration: duration ?? const Duration(seconds: 2),
          content: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 4),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Text(
                  title,
                  style: Theme.of(messenger!.context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ),
          action: subTitle != null
              ? SnackBarAction(
                  label: subTitle,
                  onPressed: () {},
                  textColor: Colors.yellowAccent,
                )
              : null,
        ),
      );

    await Future.delayed(duration ?? const Duration(seconds: 2));
    _isSnackbarClosing = false;
  } else {
    debugPrint("ScaffoldMessenger key is not attached to any context.");
  }
}
