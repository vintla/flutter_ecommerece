import 'package:ecommerce_app/app/common/helper/app_navigator.dart';
import 'package:ecommerce_app/app/common/helper/show_snackbar.dart';
import 'package:ecommerce_app/app/common/widgets/basic.dart';
import 'package:ecommerce_app/app/common/widgets/basic_appbar.dart';
import 'package:ecommerce_app/app/common/widgets/basic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 40.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Basic.text(
              "Create Account",
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 20.h),
            Basic.textField(_firstName, "Firstname"),
            SizedBox(height: 20.h),
            Basic.textField(_lastName, "Lastname"),
            SizedBox(height: 20.h),
            Basic.textField(_emailCon, "Email Address"),
            SizedBox(height: 20.h),
            Basic.textField(_passwordCon, "Password"),
            SizedBox(height: 20.h),
            BasicButton(
              onPressed: () => AppNavigator.pushAndRemove(
                context,
                '/signin',
              ),
              title: "Continue",
            ),
            SizedBox(height: 20.h),
            Basic.richText(
              "Already have an account? ",
              "Sign in",
              () {
                showSnackbar(context, "Sign in");
                AppNavigator.pushAndRemove(context, '/signin');
              },
            )
          ],
        ),
      ),
    );
  }
}
