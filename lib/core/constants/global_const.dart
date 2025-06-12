import 'package:flutter/material.dart';

class GlobalKeys {
  static final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
}

ScaffoldMessengerState? messenger =
    GlobalKeys.rootScaffoldMessengerKey.currentState;
