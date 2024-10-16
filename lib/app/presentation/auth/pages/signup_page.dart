import 'package:ecommerce_app/app/common/helper/app_navigator.dart';
import 'package:ecommerce_app/app/common/helper/show_snackbar.dart';
import 'package:ecommerce_app/app/common/routes/names.dart';
import 'package:ecommerce_app/app/common/widgets/basic.dart';
import 'package:ecommerce_app/app/common/widgets/basic_appbar.dart';
import 'package:ecommerce_app/app/common/widgets/basic_reactive_button.dart';
import 'package:ecommerce_app/app/common/widgets/basic_text_field.dart';
import 'package:ecommerce_app/app/data/auth/models/user_creation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  late final UserCreationModel userCreationModel;

  bool get isTextFieldEmpty => (_emailCon.value.text.isEmpty &&
      _lastName.value.text.isEmpty &&
      _firstName.value.text.isEmpty &&
      _passwordCon.value.text.isEmpty);

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
            BasicTextField(
              key: const Key("firstname"),
              type: FieldType.text,
              controller: _firstName,
              hintText: "Firstname",
            ),
            SizedBox(height: 20.h),
            BasicTextField(
              key: const Key("lastname"),
              type: FieldType.text,
              controller: _lastName,
              hintText: "Lastname",
            ),
            SizedBox(height: 20.h),
            BasicTextField(
              key: const Key("email"),
              type: FieldType.email,
              controller: _emailCon,
              hintText: "Email Address",
            ),
            SizedBox(height: 20.h),
            BasicTextField(
              key: const Key("password"),
              type: FieldType.password,
              controller: _passwordCon,
              hintText: "Password",
            ),
            SizedBox(height: 20.h),
            BasicReactiveButton(
              onPressed: () {
                AppNavigator.push(
                  context,
                  AppRoutes.GENDER_AND_AGE_SELECTION_PAGE,
                  args: UserCreationModel(
                    email: _emailCon.text.trim(),
                    lastName: _lastName.text.trim(),
                    password: _passwordCon.text.trim(),
                    firstName: _firstName.text.trim(),
                  ),
                );
              },
              title: "Continue",
            ),
            SizedBox(height: 20.h),
            Basic.richText(
              "Already have an account? ",
              "Sign in",
              () {
                showSnackbar(context, "Sign in");
                AppNavigator.pushAndRemove(context, AppRoutes.SIGNIN_PAGE);
              },
            )
          ],
        ),
      ),
    );
  }
}
