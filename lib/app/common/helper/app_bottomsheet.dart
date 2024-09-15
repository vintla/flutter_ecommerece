import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomSheet {
  static Future<void> show(BuildContext context, Widget widget) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.w),
          topRight: Radius.circular(25.w),
        ),
      ),
      builder: (_) => widget,
    );
  }
}
