import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Basic {
  static Widget textField(
      BuildContext context, TextEditingController controller, String hintText) {
    String text = controller.value.text;
    String errorText() {
      if (text.isEmpty) {
        return "This field is required";
      }
      if (text.length < 6) {
        return "Text must be at least 6 characters";
      }
      return "";
    }

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorText(),
      ),
    );
  }

  static Widget text(
    String text, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    int? maxLines,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize?.sp ?? 12.sp,
        fontWeight: fontWeight ?? FontWeight.normal,
        overflow: TextOverflow.ellipsis,
      ),
      maxLines: maxLines,
    );
  }

  static Widget richText(
      String text, String linkedText, void Function()? onTap) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: text),
          TextSpan(
            text: linkedText,
            recognizer: TapGestureRecognizer()..onTap = onTap,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
