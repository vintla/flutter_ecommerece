import 'package:ecommerce_app/app/core/config/config.dart';
import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String message, {Color? bgColor}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      elevation: 2,
      backgroundColor: bgColor ?? AppColors.background,
      duration: const Duration(seconds: 2),
    ),
  );
}
