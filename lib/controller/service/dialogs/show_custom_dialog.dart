import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:postmo/controller/service/navigation/navigation_service.dart';


Future<T?> showCustomDialog<T>(Widget widget, bool dismiss) async {
  if (NavigationService.navigatorKey.currentState?.overlay != null) {
    return showDialog<T?>(
      barrierDismissible: dismiss,
      context: NavigationService.navigatorKey.currentState!.context,
      builder: (_) {
        return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3), child: widget);
      },
    );
  }
  return null;
}
