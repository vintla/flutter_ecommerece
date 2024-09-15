import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/button/button_state.dart';
import '../blocs/button/button_cubit.dart';

class BasicReactiveButton extends StatelessWidget {
  final Widget? content;
  final VoidCallback? onPressed;
  final String title;
  final double? height;

  const BasicReactiveButton({
    this.content,
    required this.onPressed,
    this.title = "",
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonCubit, ButtonState>(builder: (context, state) {
      if (state is ButtonLoadingState) {
        return _loading();
      }
      return _initial();
    });
  }

  Widget _initial() {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height?.h ?? 50.h),
      ),
      child: content ??
          SizedBox(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
    );
  }

  Widget _loading() {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height?.h ?? 50.h),
      ),
      child: SizedBox(
        height: height?.h ?? 50.h,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
