import 'package:ecommerce_app/app/common/blocs/button/button_cubit.dart';
import 'package:ecommerce_app/app/common/blocs/button/button_state.dart';
import 'package:ecommerce_app/app/common/helper/show_snackbar.dart';
import 'package:ecommerce_app/app/common/widgets/basic.dart';
import 'package:ecommerce_app/app/common/widgets/basic_appbar.dart';
import 'package:ecommerce_app/app/common/widgets/basic_button.dart';
import 'package:ecommerce_app/app/data/auth/models/user_signin_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterPasswordPage extends StatelessWidget {
  final UserSigninModel userSigninModel;
  EnterPasswordPage({required this.userSigninModel, super.key});

  final TextEditingController _passwordCon = TextEditingController();

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
        child: BlocListener<ButtonCubit, ButtonState>(
          listener: (context, state) {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Basic.text(
                "Sign in",
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 20.h),
              Basic.textField(_passwordCon, "Enter your password"),
              SizedBox(height: 20.h),
              BasicButton(
                onPressed: () {},
                title: "Continue",
              ),
              SizedBox(height: 20.h),
              Basic.richText(
                "Forgot your password? ",
                "Reset password",
                () {
                  showSnackbar(context, "Reset password");
                  // AppNavigator.push(context, '/signup');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
