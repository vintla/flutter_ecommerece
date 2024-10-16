import 'package:ecommerce_app/app/common/blocs/button/button_cubit.dart';
import 'package:ecommerce_app/app/common/blocs/button/button_state.dart';
import 'package:ecommerce_app/app/common/helper/app_navigator.dart';
import 'package:ecommerce_app/app/common/helper/show_snackbar.dart';
import 'package:ecommerce_app/app/common/routes/routes.dart';
import 'package:ecommerce_app/app/common/widgets/basic.dart';
import 'package:ecommerce_app/app/common/widgets/basic_appbar.dart';
import 'package:ecommerce_app/app/common/widgets/basic_reactive_button.dart';
import 'package:ecommerce_app/app/common/widgets/basic_text_field.dart';
import 'package:ecommerce_app/app/domain/auth/usecases/send_password_reset_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final btnCubit = context.read<ButtonCubit>();
    return Scaffold(
      appBar: const BasicAppBar(),
      body: BlocListener<ButtonCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonInitialState) {
            if (_emailCon.value.text.isEmpty) {
              btnCubit.disable();
            } else {
              btnCubit.enable();
            }
          }
          if (state is ButtonFailureState) {
            showSnackbar(context, state.errorMessage, bgColor: Colors.red);
          }
          if (state is ButtonSuccessState) {
            AppNavigator.push(
                context, AppRoutes.PASSWORD_RESET_EMAIL_SENT_PAGE);
          }
        },
        child: Padding(
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
              BasicTextField(
                key: const Key("email"),
                type: FieldType.email,
                controller: _emailCon,
                hintText: "Enter email address",
              ),
              SizedBox(height: 20.h),
              BasicReactiveButton(
                onPressed: () {
                  btnCubit.execute(
                    useCase: SendPasswordResetEmailUseCase(),
                    params: _emailCon.text,
                  );
                },
                title: "Continue",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
