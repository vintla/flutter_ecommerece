import 'package:ecommerce_app/app/common/helper/app_navigator.dart';
import 'package:ecommerce_app/app/common/routes/names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/basic.dart';
import '../../../common/widgets/basic_button.dart';

class PasswordResetEmailSentPage extends StatelessWidget {
  const PasswordResetEmailSentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100.w,
            height: 100.h,
            child: Image.asset("assets/images/email_verification.png"),
          ),
          SizedBox(height: 10.h),
          Basic.text(
            "We sent you an email to reset your password.",
            fontSize: 18.sp,
          ),
          SizedBox(height: 20.h),
          BasicButton(
            onPressed: () {
              AppNavigator.pushReplacement(context, AppRoutes.SIGNIN_PAGE);
            },
            title: "Return to login page",
            width: 100.w,
          ),
        ],
      ),
    );
  }
}
