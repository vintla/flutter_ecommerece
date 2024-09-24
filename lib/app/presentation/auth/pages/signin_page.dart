import 'package:ecommerce_app/app/common/helper/app_navigator.dart';
import 'package:ecommerce_app/app/common/helper/show_snackbar.dart';
import 'package:ecommerce_app/app/common/widgets/basic.dart';
import 'package:ecommerce_app/app/common/widgets/basic_appbar.dart';
import 'package:ecommerce_app/app/common/widgets/basic_button.dart';
import 'package:ecommerce_app/app/data/auth/models/user_signin_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _emailCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(
        hideBack: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 40.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Basic.text(
              "Sign in",
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 20.h),
            Basic.textField(_emailCon, "Your email address"),
            SizedBox(height: 20.h),
            BasicButton(
              onPressed: () => AppNavigator.push(
                context,
                '/enter_password',
                args: _emailCon.text,
              ),
              title: "Continue",
            ),
            SizedBox(height: 20.h),
            Basic.richText(
              "Don't have an account? ",
              "Create one",
              () {
                showSnackbar(context, "Create one");
                AppNavigator.push(context, '/signup');
              },
            )
          ],
        ),
      ),
    );
  }
}
