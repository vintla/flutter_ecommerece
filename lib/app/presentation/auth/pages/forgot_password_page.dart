import 'package:ecommerce_app/app/common/helper/app_navigator.dart';
import 'package:ecommerce_app/app/common/helper/show_snackbar.dart';
import 'package:ecommerce_app/app/common/widgets/basic.dart';
import 'package:ecommerce_app/app/common/widgets/basic_appbar.dart';
import 'package:ecommerce_app/app/common/widgets/basic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 40.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Basic.text(
              "Forgot Password",
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 20.h),
            Basic.textField(_passwordCon, "Enter email address"),
            SizedBox(height: 20.h),
            BasicButton(
              onPressed: () => AppNavigator.push(
                context,
                '/email_verification',
              ),
              title: "Continue",
            ),
          ],
        ),
      ),
    );
  }
}
