import 'package:ecommerce_app/app/common/widgets/basic_appbar.dart';
import 'package:ecommerce_app/app/core/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        action: Container(
          padding: EdgeInsets.all(12.w),
          width: ScreenUtil().screenWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 35.h,
                width: 35.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.h),
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/profile.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.secondBackground,
                  borderRadius: BorderRadius.circular(12.h),
                ),
                child: DropdownButton(
                  borderRadius: BorderRadius.circular(12.h),
                  dropdownColor: AppColors.secondBackground,
                  focusColor: AppColors.primary,
                  underline: Container(
                    color: Colors.transparent,
                  ),
                  value: "Men",
                  icon: Icon(Icons.arrow_drop_down_outlined),
                  elevation: 10,
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  onChanged: (value) {},
                  items: const [
                    DropdownMenuItem(
                      value: "Men",
                      child: Text("Men"),
                    ),
                    DropdownMenuItem(
                      value: "Woman",
                      child: Text("Woman"),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Container(
                  height: 35.h,
                  width: 35.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        color: AppColors.background,
      ),
    );
  }
}
