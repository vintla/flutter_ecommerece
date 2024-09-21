import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Basic {
  static Widget textField(TextEditingController controller, String hintText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
    );
  }

  static Widget text(
    String text, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize?.sp ?? 12.sp,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
