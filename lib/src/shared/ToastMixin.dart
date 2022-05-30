import 'package:ansque/src/core/themes/app_colors.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

mixin ToastMixin {
  void showToast({required BuildContext context, required String message, ToastType type = ToastType.info}) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 4),
      persistent: true,
      builder: (_, controller) {
        return Flash(
          controller: controller,
          position: FlashPosition.bottom,
          behavior: FlashBehavior.fixed,
          backgroundColor: _getBackgroundColor(type),
          child: FlashBar(
            shouldIconPulse: true,
            icon: Icon(
              _getIcon(type),
              size: 24.0,
              color: Colors.white,
            ),
            content: Text(
              message,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  IconData _getIcon(ToastType type) {
    switch (type) {
      case ToastType.success:
        return Ionicons.checkmark;
      case ToastType.error:
        return Ionicons.close;
      case ToastType.info:
        return Ionicons.information_circle;
      case ToastType.warning:
        return Ionicons.warning;
    }
  }

  Color _getBackgroundColor(ToastType type) {
    switch (type) {
      case ToastType.success:
        return AppColors.primary;
      case ToastType.error:
        return AppColors.secondary;
      case ToastType.info:
        return AppColors.primary;
      case ToastType.warning:
        return AppColors.primary;
    }
  }
}

enum ToastType {
  success,
  warning,
  error,
  info,
}
