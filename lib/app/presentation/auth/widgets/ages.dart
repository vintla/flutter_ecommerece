import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/app/common/widgets/basic.dart';
import 'package:ecommerce_app/app/presentation/auth/blocs/age_selection_cubit.dart';
import 'package:ecommerce_app/app/presentation/auth/blocs/ages_display_cubit.dart';
import 'package:ecommerce_app/app/presentation/auth/blocs/ages_display_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil.defaultSize.height / 2.7,
      child: BlocBuilder<AgesDisplayCubit, AgesDisplayStates>(
        builder: (context, state) {
          if (state is AgesLoadingState) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }
          if (state is AgesLoadedState) {
            return _ages(state.ages);
          }
          if (state is AgesLoadingFailureState) {
            return Container(
              alignment: Alignment.center,
              child: Text(state.message),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
            context
                .read<AgeSelectionCubit>()
                .selectAge(ages[index].data()['value']);
          },
          child: Basic.text(ages[index].data()['value'], fontSize: 18.sp),
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 20.h,
      ),
      itemCount: ages.length,
    );
  }
}
