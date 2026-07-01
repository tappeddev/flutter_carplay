import 'package:flutter/foundation.dart';

abstract interface class AATemplate {
  const AATemplate();

  String get uniqueId;

  /// Called when this template is popped from the navigation stack.
  ///
  /// Fires for both user-initiated pops (Android Auto back button) and
  /// programmatic pops via [FlutterAndroidAuto.pop] / [FlutterAndroidAuto.popToRoot].
  /// Useful for cleaning up subscriptions, state listeners, or analytics
  /// events tied to this template's lifetime.
  ///
  /// Not called for modal templates (alerts) — those have their own lifecycle
  /// hooks via `onPresent`.
  VoidCallback? get onPop;

  Map<String, dynamic> toJson();
}
