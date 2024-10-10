import 'package:ecommerce_app/app/common/blocs/button/button_cubit.dart';
import 'package:ecommerce_app/app/common/blocs/button/button_state.dart';
import 'package:ecommerce_app/app/common/helper/app_bottomsheet.dart';
import 'package:ecommerce_app/app/common/helper/show_snackbar.dart';
import 'package:ecommerce_app/app/common/widgets/basic.dart';
import 'package:ecommerce_app/app/common/widgets/basic_appbar.dart';
import 'package:ecommerce_app/app/common/widgets/basic_reactive_button.dart';
import 'package:ecommerce_app/app/core/config/themes/app_colors.dart';
import 'package:ecommerce_app/app/data/auth/models/user_creation_model.dart';
import 'package:ecommerce_app/app/domain/auth/usecases/signup.dart';
import 'package:ecommerce_app/app/presentation/auth/blocs/age_selection_cubit.dart';
import 'package:ecommerce_app/app/presentation/auth/blocs/ages_display_cubit.dart';
import 'package:ecommerce_app/app/presentation/auth/blocs/gender_selection_cubit.dart';
import 'package:ecommerce_app/app/presentation/auth/widgets/ages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  final UserCreationModel userCreationModel;
  const GenderAndAgeSelectionPage({required this.userCreationModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(
        hideBack: true,
      ),
      body: BlocListener<ButtonCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonFailureState) {
            showSnackbar(context, state.errorMessage);
          }
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 40.w),
              child: Column(
                children: [
                  _tellUs(),
                  SizedBox(
                    height: 30.h,
                  ),
                  _selectYourGender(),
                  SizedBox(
                    height: 30.h,
                  ),
                  _genders(context),
                  SizedBox(
                    height: 30.h,
                  ),
                  _howOld(),
                  SizedBox(
                    height: 30.h,
                  ),
                  _ages(),
                ],
              ),
            ),
            const Spacer(),
            _finishButton(context),
          ],
        ),
      ),
    );
  }

  Widget _tellUs() {
    return Basic.text("Tell us about yourself",
        fontSize: 24.sp, fontWeight: FontWeight.w500);
  }

  Widget _genders(BuildContext context) {
    return BlocBuilder<GenderSelectionCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            genderTile(context, 1, 'Men'),
            SizedBox(
              height: 20.h,
            ),
            genderTile(context, 2, 'Women'),
          ],
        );
      },
    );
  }

  Widget genderTile(BuildContext context, int genderIndex, String gender) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.read<GenderSelectionCubit>().selectGender(genderIndex);
        },
        child: Container(
          height: 60.h,
          decoration: BoxDecoration(
            color: context.read<GenderSelectionCubit>().selectedGender ==
                    genderIndex
                ? AppColors.primary
                : AppColors.secondBackground,
            borderRadius: BorderRadius.circular(30.w),
          ),
          child: Center(
            child: Basic.text(
              gender,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectYourGender() {
    return Basic.text(
      "What gender are you?",
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
    );
  }

  Widget _howOld() {
    return Basic.text(
      "How old are you?",
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
    );
  }

  Widget _ages() {
    return BlocBuilder<AgeSelectionCubit, String>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            AppBottomSheet.show(
              context,
              MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: context.read<AgeSelectionCubit>(),
                  ),
                  BlocProvider.value(
                    value: context.read<AgesDisplayCubit>()..displayAges(),
                  ),
                ],
                child: const Ages(),
              ),
            );
          },
          child: Container(
            height: 60.h,
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            decoration: BoxDecoration(
              color: AppColors.secondBackground,
              borderRadius: BorderRadius.circular(30.w),
            ),
            child: Row(
              children: [
                Basic.text(
                  state,
                ),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _finishButton(BuildContext context) {
    return Container(
      height: 100.h,
      color: AppColors.secondBackground,
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Center(
        child: Builder(
          builder: (context) {
            return BasicReactiveButton(
              onPressed: () {
                userCreationModel.age =
                    context.read<AgeSelectionCubit>().selectedAge;
                userCreationModel.gender =
                    context.read<GenderSelectionCubit>().selectedGender;

                context.read<ButtonCubit>().execute(
                    useCase: SignupUseCase(), params: userCreationModel);
              },
              title: "Finish",
            );
          },
        ),
      ),
    );
  }
}
